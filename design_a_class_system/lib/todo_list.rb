class Todo_list
    def initialize
        @todo_list = []
    end

    def add(todo)
        @todo_list << todo
    end

    def tasks
        return "There are no tasks to complete" if @todo_list.length == 0
        return @todo_list
    end

    def incomplete
        return @todo_list.filter{ |task| !task.done? }
    end

    def complete
        return @todo_list.filter{ |task| task.done? }
    end

    def give_up
        return @todo_list.each do |task|
            task.mark_done
        end
    end
end