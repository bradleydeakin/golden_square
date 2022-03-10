require "design_class"

RSpec.describe Todo do
    it "returns a list of tasks to do" do
        todo_list = Todo.new
        expect(todo_list.tasks).to eq "Todo list: "
    end

    it "returns a list of task which have been added to the todo list" do
        todo_list = Todo.new
        todo_list.add("go shopping")
        expect(todo_list.tasks).to eq "Todo list: go shopping"
    end

    it "adds to a list which already contains tasks" do
        todo_list = Todo.new
        todo_list.add("go shopping")
        todo_list.add("clean bedroom")
        expect(todo_list.tasks).to eq "Todo list: go shopping clean bedroom"
    end
    
    context "given a task to check off list" do
        it "returns task complete" do
            todo_list = Todo.new
            todo_list.add("go shopping")
            todo_list.add("clean bedroom")
            expect(todo_list.complete("go shopping")).to eq "task complete"
        end

        it "removes completed task from list" do
            todo_list = Todo.new
            todo_list.add("go shopping")
            todo_list.add("clean bedroom")
            todo_list.complete("go shopping")
            expect(todo_list.tasks).to eq "Todo list: clean bedroom"
        end
    end 

    context "given  task that is not in todo_list" do
        it "fails" do
            todo_list = Todo.new
            todo_list.add("go shopping")
            todo_list.add("clean bedroom")
            expect { todo_list.complete("wash car") }.to raise_error "task is not in to do list"
        end
    end
end