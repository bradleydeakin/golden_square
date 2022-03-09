require "read_text"

RSpec.describe "read_text method" do
    it "returns the time it takes to read text" do
        result = read_text("This morning I had cereal for breakfast")
        expect(result).to eq "estimated time = 2 seconds"
    end
end