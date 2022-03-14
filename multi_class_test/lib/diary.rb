require "diary_entry"
class Diary
    def initialize
        @diary = []
        @reading_times
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      # Returns nothing
        @diary.push(entry)
    end
  
    def all
      # Returns a list of instances of DiaryEntry
      return @diary
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
      return @diary.map do |entry|
        entry.count_words
      end.sum
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
      fail "Reading time must be above zero" unless wpm > 0
      return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
      # no_of_words_we_can_read = wpm * minutes
      # @reading_times = @reading_times.push(@diary.reading_time)
      # acceptable_times = []
      fail "Reading time must be above zero" unless wpm > 0
      readable_entries = @diary.filter do |entry|
        entry.reading_time(wpm) <= minutes
      end
      sorted_by_length = readable_entries.sort_by do |entry|
        entry.count_words
      end
      return sorted_by_length.last

    end
end