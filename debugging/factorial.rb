# File: factorial.rb
def factorial(n)
    product = 1
    total = 0
    while n > 0
      binding.irb # Mystery new line!
      product *= n
      n -= 1      
      binding.irb
    #   total += product
    #   binding.irb
    end
    binding.irb
    product
end
  
p factorial(5)