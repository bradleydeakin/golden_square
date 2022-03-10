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

class Music_list

    def initialize(track = "")
        @tracks = [track]
    end

    def add_song(song)
        @tracks = @tracks.push(song) 
    end

    def tracks 
        if @tracks.length == 0
            return "Tracks listened too: "
        else 
            "Tracks listened too: " + list
        end
    end

    private
    def list
        # todo = @todos.each{ |t| puts t }
        list = @tracks.join("")
        return list
    end

end