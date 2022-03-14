require "todo_list"

RSpec.describe TodoList do
    it "returns an empty to do list" do
        todo = TodoList.new
        expect(todo.incomplete).to eq "There are no tasks to complete"
    end
end