require "counter"

RSpec.describe Counter do
    it "returns the number its counted to" do
        total = Counter.new
        total.add(20)
        result = total.report
        expect(result).to eq "Counted to 20 so far."
    end
end
