require "diary"
require "diary_entry"

RSpec.describe Diary do
    it "adds a diary entry to the diary" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        diary.add(diary_entry_1)
        expect(diary.all).to eq [diary_entry_1]
    end

    it "counts the words in all diary entries" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        diary_entry_2 = DiaryEntry.new("tuesday", "code academy tutorial")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.count_words).to eq 6

    end

    it "has word count of 0" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("monday", "")
        diary_entry_2 = DiaryEntry.new("tuesday", "")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.count_words).to eq 0
    end

    it "calculates the time to read all entries" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
        diary_entry_2 = DiaryEntry.new("tuesday", "code academy tutorial")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
    end

    it "fails if wpm is zero" do
        diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
        expect{ diary_entry_1.reading_time(0) }.to raise_error "Reading time must be above zero"
    end
    describe "finding best entry for reading" do
       context "where we have one entry that is readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
                diary.add(diary_entry_1)
                expect(diary.find_best_entry_for_reading_time(2, 2)).to eq diary_entry_1
            end
        end

        context "where there is one entry but it is unreadbale in the time" do
            it "returns nil" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
                diary.add(diary_entry_1)
                expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil
            end
        end 
        it "returns the entry that is best for reading time available" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial")
            diary_entry_3 = DiaryEntry.new("wednesday", "code academy tutotial loops")
            diary_entry_2 = DiaryEntry.new("tuesday", "code academy tutorial. Makers pair programming")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            diary.add(diary_entry_3)
            expect(diary.find_best_entry_for_reading_time(2, 2)).to eq diary_entry_3
        end

        it "fails if wpm is zero" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("monday", "code academy tutorial class objects")
            diary_entry_2 = DiaryEntry.new("tuesday", "code academy tutorial. Makers pair programming")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect{ diary.find_best_entry_for_reading_time(0,4) }.to raise_error "Reading time must be above zero"
        end
end   end