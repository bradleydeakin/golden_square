require "diary_class"
require "diary_entry"
require "contact"

RSpec.describe Diary do
    
    context "constructing the class" do
        it "returns an empty Diary" do
            diary = Diary.new
            expect(diary.entries).to eq []
        end
    end

    context "retrieving and returning diary entries" do
        it "returns diary entries added to diary" do
            diary = Diary.new
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            diary.add(entry)
            expect(diary.entries).to eq [entry]
        end
    end

    context "recieves and returns phone numbers" do
        it "returns list of numbers" do
            diary = Diary.new
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            contact = Contact.new("Brad", "0798245361")
            contact2 = Contact.new("Ben", "0798243431")
            diary.add_contact(contact)
            diary.add_contact(contact2)
            expect(diary.contacts).to eq [contact,contact2]
        end
    end

    it "returns list of contacts and entries together" do
        diary = Diary.new
        entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
        contact = Contact.new("Brad", "0798245361")
        contact2 = Contact.new("Ben", "0798243431")
        diary.add_contact(contact)
        diary.add_contact(contact2)
        entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
        diary.add(entry)
        expect(diary.contacts).to eq [contact,contact2]
        expect(diary.entries).to eq [entry]
    end

    context "it counts all the words in the diary entries" do
        it "returns words in diary entries" do
            diary = Diary.new
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            diary.add(entry)
            entry2 = Diary_entry.new("tuesday", "Makers Academy workshop")
            diary.add(entry2)
            expect(diary.count_words).to eq 7
        end

        it "returns zero if diary is empty" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
        end
    end

    context "calculating reading time for diary" do
        it "returns time to read diary" do
            diary = Diary.new
            entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
            diary.add(entry)
            entry2 = Diary_entry.new("tuesday", "Makers Academy workshop")
            diary.add(entry2)
            expect(entry.reading_time(2)).to eq 2
        end

        context "it fails when wpm is 0" do
            it "fails" do
                diary = Diary.new
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
                diary.add(entry)
                entry2 = Diary_entry.new("tuesday", "Makers Academy workshop")
                diary.add(entry2)
                expect{ entry.reading_time(0) }.to raise_error "words per minute must be above 0"
            end
        end
    end

    describe "finding best entry for reading time" do
        context "when there is only one entry but is unreadable in the time" do
            it "returns nil" do
                diary = Diary.new
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming class systems")
                diary.add(entry)
                expect(diary.finding_best_entry_for_reading_time(2, 2)).to eq nil
            end 
        end

        context "when there is one entry but it is readable in the time" do
            it "returns readable entry" do
                diary = Diary.new
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
                diary.add(entry)
                expect(diary.finding_best_entry_for_reading_time(2, 2)).to eq entry
            end
        end

        context "when there are 2 entries but only one is readable in the time" do
            it "returns readable entry" do
                diary = Diary.new
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
                diary.add(entry)
                entry2 = Diary_entry.new("Monday", "Makers Academy Pair Programming class systems")
                diary.add(entry2)
                expect(diary.finding_best_entry_for_reading_time(2, 2)).to eq entry
            end 
        end

        context "when there are multiple readable entries" do
            it "returns the best suited entry" do
                diary = Diary.new
                entry = Diary_entry.new("Monday", "Makers Academy Pair Programming")
                diary.add(entry)
                entry2 = Diary_entry.new("Monday", "Makers Academy Pair Programming class systems")
                diary.add(entry2)
                entry3 = Diary_entry.new("Monday", "Makers Academy")
                diary.add(entry3)
                expect(diary.finding_best_entry_for_reading_time(2, 2)).to eq entry
            end
        end

        context "when wpm is 0" do
            it "fails if wpm is zero" do
                diary = Diary.new
                diary_entry_1 = Diary_entry.new("monday", "code academy tutorial class objects")
                diary_entry_2 = Diary_entry.new("tuesday", "code academy tutorial. Makers pair programming")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                expect{ diary.finding_best_entry_for_reading_time(0,4) }.to raise_error "wpm must be above 0"
            end
        end
    end
end