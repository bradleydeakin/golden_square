require 'exercise'

RSpec.describe StringRepeater do
    it "returns a string repeated a number of times" do
        io = double :io
        expect(io).to receive(:puts).with("Hello. I will repeat a string many times").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return("football").ordered
        expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(io).to receive(:gets).and_return("5").ordered
        expect(io).to receive(:puts).with("Here is your result").ordered
        expect(io).to receive(:puts).with("footballfootballfootballfootballfootball").ordered
        repeater = StringRepeater.new(io)
        repeater.run
    end
end