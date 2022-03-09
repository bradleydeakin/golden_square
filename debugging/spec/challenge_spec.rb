require "challenge"

RSpec.describe "get_most_common_letter method" do
    it "returns the most common letter" do
        expect(get_most_common_letter("the roof, the roof, the roof is on fire!")).to eq "o"
    end 
end