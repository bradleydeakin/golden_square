require "todo"

RSpec.describe "search method" do
    it "returns true if todo is in text" do
        result = search("todo : laundry, groceries, washing")
        expect(result).to eq true
    end

    it "returns false if todo is not in text" do
        result = search("tasks: laundry, groceries, washing")
        expect(result).to eq false
    end
end