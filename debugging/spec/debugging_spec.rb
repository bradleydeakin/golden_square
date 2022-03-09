require "debugging"

RSpec.describe "say_hello" do
    it "returns a hello and name" do
    result = say_hello("Brad")
    expect(result).to eq "hello Brad"
end
end