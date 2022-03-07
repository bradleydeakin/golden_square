require "greet"

RSpec.describe "greet method" do
    it "returns Hello and my name" do
        result = greet("Brad")
        expect(result).to eq "Hello Brad"
    end
end