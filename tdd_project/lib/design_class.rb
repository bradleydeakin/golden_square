class Todo
    def initialize 
    @todos = []
    end
    def add(task)
        @todos = @todos.push(task)
    end

    def tasks 
        # @todos = @todo.each{ |t| return t }
        if @todos.length == 0
           return "Todo list: "
        else
            return "Todo list: " + list
        end      
    end

    def complete(task)
        fail "task is not in to do list" unless @todos.include?(task)
        @todos.delete(task)
        return "task complete"
    end  

    private
    def list
        # todo = @todos.each{ |t| puts t }
        list = @todos.join(" ")
        return list
    end
end