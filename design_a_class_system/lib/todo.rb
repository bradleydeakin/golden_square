class Todo

    def initialize(task)
        @todo = task
        @status = "incomplete"
    end

    def task
        return @todo
    end

    def mark_done
        @status = "complete"
    end

    def done?
        if @status == "complete"
            return true
        else
            return false
        end
    end
end