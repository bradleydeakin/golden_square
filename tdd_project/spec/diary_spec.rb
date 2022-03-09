require "diary"
RSpec.describe "make snippet method" do
    it "takes a string and returns first five words and ... if there are more" do
        result = make_snippet("Hello my name is Bradley and I am nineteen")
        expect(result).to eq "Hello my name is Bradley ..."
    end

    it "returns the inputted string if it is less than 5 words" do
        result = make_snippet("Hello Bradley")
        expect(result).to eq "Hello Bradley"
    end
end


RSpec.describe "count_words method" do
    it "returns number of words in a string" do
        result = count_words("Hello my name is Bradley")
        expect(result).to eq 5
    end
end