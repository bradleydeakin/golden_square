require "gratitude"

RSpec.describe Gratitudes do
    it "returns Be grateful for life" do
        gratitudes = Gratitudes.new
        gratitudes.add('life')
        result = gratitudes.format
        expect(result).to eq "Be grateful for: life"
    end
end