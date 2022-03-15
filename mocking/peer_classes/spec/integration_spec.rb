require "secret_diary"
require "diary"

RSpec.describe SecretDiary do

    it "constructs" do
        diary = Diary.new("Makers academy")
        secret_diary = SecretDiary.new(diary)
    end
    context "it fails becasue secret diary is locked" do
        it "fails" do
            diary = Diary.new("Makers academy")
            secret_diary = SecretDiary.new(diary)
            secret_diary.lock
            expect { secret_diary.read }.to raise_error "Go away!"
        end
    end 
    context "when secret diary is unlocked" do      
        it "reads the contents of the diary" do
            diary = Diary.new("Makers academy")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            expect(secret_diary.read).to eq  "Makers academy"
        end
    end
end