require "test_drive_class"

RSpec.describe DiaryEntry do

    it "returns title of book as a string" do
        diary = DiaryEntry.new("monday", "blalddsdsdd")
        expect(diary.title).to eq "monday"
    end

    it "returns the content of diary entry" do
        diary = DiaryEntry.new("monday", "makers academy")
        expect(diary.contents).to eq "makers academy"
    end
    describe "#count_words"do 
        it "count_words method returns number of words in contents" do
            diary = DiaryEntry.new("monday", "makers academy")
            expect(diary.count_words).to eq 2
        end 

        it "returns 0 if contents is 0" do
            diary = DiaryEntry.new("monday", " ")
            expect(diary.count_words).to eq 0
        end
    end

    describe "#reading_time" do
        context "given sensible wpm number (200)" do
            it "returns the number of minutes it takes to rread the text" do
                diary = DiaryEntry.new("monday", "one " * 550)
                expect(diary.reading_time(200)).to eq 3
            end
        end

        context "given a wpm of zero" do
            it "fails" do
                diary = DiaryEntry.new("monday", "one two three")
                expect { diary.reading_time(0) }.to raise_error "Reading time must be above 0"
            end
        end
    end

    describe "#reading_chunk method" do
        context "with a text readable within given number of minutes" do
            it "returns the full contents" do
                diary = diary = DiaryEntry.new("monday", "one two three")
                chunk = diary.reading_chunk(200, 1)
                expect(chunk).to eq "one two three"
            end
        end

        context "content given unreadable in time" do
            it "returns readable chunk" do
                diary = diary = DiaryEntry.new("monday", "one two three")
                chunk = diary.reading_chunk(2, 1)
                expect(chunk).to eq "one two"
            end

            it "returns the next chunk when it is called" do
                diary = diary = DiaryEntry.new("monday", "one two three")
                diary.reading_chunk(2, 1)
                chunk = diary.reading_chunk(2, 1)
                expect(chunk).to eq "three"
            end

            it "restarts after reading the whole text" do
                diary = diary = DiaryEntry.new("monday", "one two three")
                diary.reading_chunk(2, 1)
                diary.reading_chunk(1, 1)
                chunk = diary.reading_chunk(2, 1)
                expect(chunk).to eq "one two"

            end
        end

        context "given a wpm of zero" do
            it "fails" do
                diary = DiaryEntry.new("monday", "one two three")
                expect { diary.reading_chunk(0, 5) }.to raise_error "Reading time must be above 0"
            end
        end
    end

end