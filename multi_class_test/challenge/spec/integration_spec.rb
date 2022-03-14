require "todo_list"
require "todo"

RSpec.describe TodoList do

    it "returns a list of incomplete tasks to do" do
        todo_list = TodoList.new
        todo = Todo.new("go shopping")
        todo_2 = Todo.new("wash car")
        todo_list.add(todo)
        todo_list.add(todo_2)
        expect(todo_list.incomplete).to eq [todo , todo_2]
    end

    it "returns todo list empty if there ae no tasks" do
        todo_list = TodoList.new
        expect(todo_list.incomplete).to eq "There are no tasks to complete"
    end

    it "it returns a list of completed tasks" do
        todo_list = TodoList.new
        todo = Todo.new("go shopping")
        todo_2 = Todo.new("wash car")
        todo_list.add(todo)
        todo_list.add(todo_2)
        todo.mark_done!
        # todo_2.mark_done!
        expect(todo_list.complete).to eq [todo]
    end

    it "returns all todos as completed" do
        todo_list = TodoList.new
        todo = Todo.new("go shopping")
        todo_2 = Todo.new("wash car")
        todo_list.add(todo)
        todo_list.add(todo_2)
        todo_list.give_up!
        expect(todo_list.complete).to eq [todo, todo_2]
    end
end