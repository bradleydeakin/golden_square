require "diary_entry"

RSpec.describe Diary_entry do

    context "creating a diary entry" do
        it "returns an entry" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.entry).to eq "Monday: Makers Academy Pair Programming"
        end

        it "returns the title" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.title).to eq "Monday"
        end

        it "returns the contents" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.contents).to eq "Makers Academy Pair Programming"
        end
    end

    context "counting words in an entry" do
        it "returns number of words in a string" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.count_words).to eq 4
        end

        it "returns 0 when entry is empty" do
            entry = Diary_entry.new("Monday", "")
            expect(entry.count_words).to eq 0
        end
    end

    context "calculating reading time for an entry" do
        it "returns time to read entry" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.reading_time(2)).to eq 2
        end

        context "it fails when wpm is 0" do
            it "fails" do
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
                expect{ entry.reading_time(0) }.to raise_error "words per minute must be above 0"
            end
        end
    end

    context "reading chunks of an entry" do
        it "returns full entry if it can be read in given time" do
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            expect(entry.reading_chunk(2,5)).to eq "Makers Academy Pair Programming"
        end


        it "returns entry if it can be read within the minutes given" do
            diary_entry_1 = Diary_entry.new("monday", "code academy tutorial class objects")
            chunk = diary_entry_1.reading_chunk(2, 3)
            expect(chunk).to eq "code academy tutorial class objects"
        end

        it "returns the next chunk if the entry is greater than words that can be read" do
            diary_entry_1 = Diary_entry.new("monday", "code academy tutorial class objects. makers academy pair programming")
            diary_entry_1.reading_chunk(2, 2.5)
            chunk = diary_entry_1.reading_chunk(2, 2.5)
            expect(chunk).to eq "makers academy pair programming"
        end

        it "returns to the beginning after reading entry" do
            diary_entry_1 = Diary_entry.new("monday", "code academy tutorial class objects")
            diary_entry_1.reading_chunk(2, 2)
            diary_entry_1.reading_chunk(1, 1)
            chunk = diary_entry_1.reading_chunk(2, 3)
            expect(chunk).to eq "code academy tutorial class objects"
        end

        context "given a wpm of zero" do
            it "fails" do
                diary = Diary_entry.new("monday", "one two three")
                expect { diary.reading_chunk(0, 5) }.to raise_error "Reading time must be above 0"
            end
        end
    end


end