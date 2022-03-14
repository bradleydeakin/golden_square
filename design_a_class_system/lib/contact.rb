class Contact

    def initialize(name, number)
        @name = name
        @number = number
    end

    def number
        return "#{@name}: #{@number}"
    end
end