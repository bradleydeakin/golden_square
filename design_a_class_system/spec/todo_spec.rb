require "todo"

RSpec.describe Todo do

    it "returns a task as a string" do
        task = Todo.new("go shopping")
        expect(task.task).to eq "go shopping"
    end

    it "returns true when status is complete" do
        task = Todo.new("go shopping")
        expect(task.task).to eq "go shopping"
        task.mark_done
        expect(task.done?).to eq true
    end
    
    it "returns false when status is incomplete" do
        task = Todo.new("go shopping")
        expect(task.task).to eq "go shopping"
        expect(task.done?).to eq false
    end


end