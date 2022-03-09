require "grammar"

RSpec.describe "check grammar method" do
    it "returns true if first word begins with a capital and sentence ends in ."do
    result = check_grammar("Hello my name is Bradley.")
    expect(result).to eq true
    end

    it "returns true if first word has no capital letter and sentence doesn't in full stop" do
        result = check_grammar("hello my name is Bradley")
        expect(result).to eq false
    end
end