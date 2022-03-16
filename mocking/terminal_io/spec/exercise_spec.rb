require "exercise"

RSpec.describe InteractiveCalculator do
    it "returns the difference between 2 numbers" do
        io = double :io        
        
        expect(io).to receive(:puts).with("Hello. I will subtract two numbers").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return("4").ordered
        expect(io).to receive(:puts).with("please enter another number").ordered
        expect(io).to receive(:gets).and_return("2").ordered
        expect(io).to receive(:puts).with("Here is your result:").ordered
        expect(io).to receive(:puts).with("4 - 2 = 2").ordered

        calculator = InteractiveCalculator.new(io)
        calculator.run
    end
end