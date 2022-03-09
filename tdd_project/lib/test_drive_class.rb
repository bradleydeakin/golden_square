class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
      # Returns the title as a string
      return @title
    end
  
    def contents
      # Returns the contents as a string
      return @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
    #   words = @contents.split
      return words.length
    end

    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      fail "Reading time must be above 0" unless wpm > 0
      return (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes)
        fail "Reading time must be above 0" unless wpm > 0
        no_words_we_can_read = wpm * minutes
        start_from = @furthest_word_read
        end_at = @furthest_word_read + no_words_we_can_read
        words_list = words[start_from, end_at]
        if end_at >= count_words
            @furthest_word_read = 0
        else
            @furthest_word_read = end_at
        end
        return words_list.join(" ")
    end

    private
    def words
        return @contents.split
    end
end