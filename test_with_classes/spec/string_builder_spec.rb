require "string_builder"

RSpec.describe StringBuilder do
    it "returns a new string" do
        sentence = StringBuilder.new
        sentence.add("Hello Brad")
        result = sentence.output
        expect(result).to eq "Hello Brad"
    end

   it "returns length of string" do
        length = StringBuilder.new
        length.add("hello Brad")
        result = length.size
        expect(result).to eq 10
   end
end