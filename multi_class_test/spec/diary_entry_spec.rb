require "diary_entry"

RSpec.describe DiaryEntry do
    it "returns the title of entry" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        expect(diary_entry_1.title).to eq "monday"
    end

    it "returns contents of string do" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        expect(diary_entry_1.contents).to eq "code academy tutorial"
    end

    it "returns number of words in contents of entry" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        expect(diary_entry_1.count_words).to eq 3
    end

    it "returns empty if number of words is zero" do
        diary_entry_1 = DiaryEntry.new("monday", "")
        expect(diary_entry_1.count_words).to eq 0
    end

    it "returns one if number of words in contents of entry = 1" do
        diary_entry_1 = DiaryEntry.new("monday", "code")
        expect(diary_entry_1.count_words).to eq 1
    end
    it "fails if wpm is zero" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
        expect{ diary_entry_1.reading_time(0) }.to raise_error "Reading time must be above zero"
    end
    
    it "returns time to read text" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
        expect(diary_entry_1.reading_time(2)).to eq 3
    end

    it "returns 0 if reading time is 0" do
        diary_entry_1 = DiaryEntry.new("monday", "")
        expect(diary_entry_1.reading_time(2)).to eq 0
    end

    it "returns one if reading time is 1" do
        diary_entry_1 = DiaryEntry.new("monday", "code")
        expect(diary_entry_1.reading_time(2)).to eq 1
    end

    it "returns entry if it can be read within the minutes given" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
        chunk = diary_entry_1.reading_chunk(2, 3)
        expect(chunk).to eq "code academy tutorial class objects"
    end

    it "returns the next chunk if the entry is greater than words that can be read" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects. makers academy pair programming")
        diary_entry_1.reading_chunk(2, 2.5)
        chunk = diary_entry_1.reading_chunk(2, 2.5)
        expect(chunk).to eq "makers academy pair programming"
    end

    it "returns to the beginning after reading entry" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
        diary_entry_1.reading_chunk(2, 2)
        diary_entry_1.reading_chunk(1, 1)
        chunk = diary_entry_1.reading_chunk(2, 3)
        expect(chunk).to eq "code academy tutorial class objects"
    end

    context "given a wpm of zero" do
        it "fails" do
            diary = DiaryEntry.new("monday", "one two three")
            expect { diary.reading_chunk(0, 5) }.to raise_error "Reading time must be above 0"
        end
    end

    
end