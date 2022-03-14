class Todo
    def initialize(task) # task is a string
      # ...
      @todo = task
    #   @task = task
      @status = "incomplete"
    end
  
    def task
      # Returns the task as a string
      return @todo
    end
  
    def mark_done!
      # Marks the todo as done
      # Returns nothing

        @status = "complete"

    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      if @status == "complete"
        return true
      else
        return false
      end
    end
end