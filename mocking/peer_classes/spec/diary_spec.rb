require "diary"

RSpec.describe Diary do
    it "returns contents of diary" do
        diary = Diary.new("Makers academy")
        expect(diary.read).to eq "Makers academy"
    end
end
