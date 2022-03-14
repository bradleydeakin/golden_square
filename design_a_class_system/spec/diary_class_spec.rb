require "diary_class"

RSpec.describe Diary do
        
    context "constructing the class" do
        it "returns an empty Diary" do
            diary = Diary.new
            expect(diary.entries).to eq []
        end
    end

end
