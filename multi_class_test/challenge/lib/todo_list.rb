class TodoList
    def initialize
        @todo_list = []
    end
  
    def add(todo) # todo is an instance of Todo
      # Returns nothing
        @todo_list.push(todo)
      
    end
  
    def incomplete
      # Returns all non-done todos
      if @todo_list.length == 0
        return "There are no tasks to complete"
      else
        @todo_list.select {|task| !task.done? }
      end  
    end
  
    def complete
      # Returns all complete todos
      @todo_list.select {|task| task.done? }  
    end
  
    def give_up!
      # Marks all todos as complete
      # how to use map
      @todo_list.each do |task|
        task.mark_done!
      end
    end
 end