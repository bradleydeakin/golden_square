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
      return 0 if @contents.empty?
      words = @contents.count(" ") + 1
      return words
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      fail "Reading time must be above zero" unless wpm > 0
      return  (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
      fail "Reading time must be above 0" unless wpm > 0
      no_of_words_we_can_read = wpm * minutes
      start_at = @furthest_word_read
      end_at = @furthest_word_read + no_of_words_we_can_read
      words = @contents.split
      chunk = words[start_at, end_at]
      if end_at >= count_words
        @furthest_word_read = 0
      else
        @furthest_word_read = end_at
      end
      return chunk.join(" ")
    end
  end