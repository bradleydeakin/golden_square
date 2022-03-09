class GrammarStats
    def initialize
      @passed = 0
      @checked = 0
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
      characters = text.split(//)
      if characters[0] == characters[0].upcase && characters.last == "." 
        @checked += 1
        @passed += 1
        return true
      elsif characters[0] == characters[0].upcase && characters.last == "!"
        @checked += 1
        @passed += 1
        return true
      elsif characters[0] == characters[0].upcase && characters.last == "?"
        @checked += 1
        @passed += 1
        return true
      else
        @passed = @passed
        @checked += 1
        return false  
      end
    end
  
    def percentage_good
        # if check == true 
        #     @checked += 1
        #     @passed += 1
        # else
        #     @passed = @passed
        # end 
        # return @passed + @checked
        decimal = @passed / @checked.to_f
        percentage = decimal * 100
        return percentage.to_f
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
end