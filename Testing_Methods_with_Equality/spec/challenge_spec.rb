require "challenge"

RSpec.describe "report_length method" do
    it "returns the length of the string" do
        result = report_length("hello")
        expect(result).to eq "The string was 5 characters long"
    end
end