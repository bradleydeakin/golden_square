require "challenge_test_classes"

RSpec.describe GrammarStats do
    it "returns true if string begins with capital letter and ends with . , !, ?"do
        sentence = GrammarStats.new
        expect(sentence.check("Hello Brad!")).to eq true
    end

    it "returns false if string does not begin with capital letter and does not end with . , !, ?"do
    sentence = GrammarStats.new
    expect(sentence.check("hello Brad")).to eq false
    end

    it "returns 100 if all texts passed" do
        sentence = GrammarStats.new
        sentence.check("Hello Brad!")
        sentence.check("Hello Brad.")
        expect(sentence.percentage_good).to eq 100
    end

    it "returns 50 if half of tests passed" do
        sentence = GrammarStats.new
        sentence.check("Hello Brad!")
        sentence.check("Hello Brad")
        expect(sentence.percentage_good).to eq 50
    end

    it "returns 25 if a quater of tests passed" do
        sentence = GrammarStats.new
        sentence.check("Hello Brad!")
        sentence.check("Hello Brad")
        sentence.check("hello brad")
        sentence.check("hello brad.")
        expect(sentence.percentage_good).to eq 25
    end

    it "returns 75 if a 3/4 of tests passed" do
        sentence = GrammarStats.new
        sentence.check("Hello Brad!")
        sentence.check("Hello Brad!")
        sentence.check("hello brad")
        sentence.check("Hello brad.")
        expect(sentence.percentage_good).to eq 75
    end
end