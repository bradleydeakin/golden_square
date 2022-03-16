class InteractiveCalculator

    def initialize(io)
        @io = io
    end

    def run
        @io.puts "Hello. I will subtract two numbers"
        @io.puts "Please enter a number"
        num1 = @io.gets.to_i
        @io.puts "please enter another number"
        num2 = @io.gets.to_i
        @io.puts "Here is your result:"
        # result = num1 - num2
        @io.puts "#{num1} - #{num2} = #{num1 - num2}"
    end
end
# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1