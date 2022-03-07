require "check_word"

RSpec.describe "check_word method" do
    it "returns a wrong messge if a wrong answer is given" do
        result = check_word("yellow")
        expect(result).to eq "WRONG"
    end

    it "returns a correct message if given the right word" do
        result = check_word("horse")
        expect(result).to eq "Correct! Come in."
    end

    it "returns a close but nope message if the last and first characters are correct" do
        result = check_word("house")
        expect(result).to eq "Close, but nope."
    end

    it "returns a wrong message if only first letter is coreect" do
        result = check_word("holiday")
        expect(result).to eq "WRONG"
    end

    it "returns a wrong message if only last letter is correct" do
        result = check_word("pope")
        expect(result).to eq "WRONG"
    end
end