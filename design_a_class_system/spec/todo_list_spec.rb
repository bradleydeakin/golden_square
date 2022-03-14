require "todo_list"
require "todo"

RSpec.describe Todo_list do

    it "returns a list of todos" do
        todo = Todo_list.new
        task = Todo.new("go shopping")
        todo.add(task)
        expect(todo.tasks).to eq [task]
    end

    it "returns all incomplete tasks" do
        todo = Todo_list.new
        task = Todo.new("go shopping")
        todo.add(task)
        task2 = Todo.new("wash car")
        todo.add(task2)
        expect(todo.incomplete).to eq [task, task2]
    end

    it "returns all complete tasks" do
        todo = Todo_list.new
        task = Todo.new("go shopping")
        todo.add(task)
        task2 = Todo.new("wash car")
        todo.add(task2)
        task2.mark_done
        expect(todo.incomplete).to eq [task]
        expect(todo.complete).to eq [task2]
    end

    it "returns todo list empty if there ae no tasks" do
        todo_list = Todo_list.new
        expect(todo_list.tasks).to eq "There are no tasks to complete"
    end

    it "returns all todos as complete" do
        todo = Todo_list.new
        task = Todo.new("go shopping")
        todo.add(task)
        task2 = Todo.new("wash car")
        todo.add(task2)
        todo.give_up
        expect(todo.complete).to eq [task, task2]
    end

end