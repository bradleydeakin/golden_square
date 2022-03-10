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

RSpec.describe Music_list do
    it "returns empty list of tracks listened too no music has been listend too" do
        music_list = Music_list.new()
        expect(music_list.tracks).to eq "Tracks listened too: "
    end

    it "returns list of tracks if music has been listend too" do
        music_list = Music_list.new("Best of you")
        expect(music_list.tracks).to eq "Tracks listened too: Best of you"
    end

    it "adds a track to the ttrack list and then returns that list" do
        music_list = Music_list.new()
        music_list.add_song("Best of you")
        expect(music_list.tracks).to eq "Tracks listened too: Best of you"
    end
end