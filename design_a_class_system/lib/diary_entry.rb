class Diary_entry

    def initialize(title, contents)
        @title = title
        @contents = contents
        @furthest_word = 0
    end

    def entry
        return "#{@title}: #{@contents}"
    end

    def title
        return @title
    end

    def contents
        return @contents
    end

    def count_words
        return 0 if @contents.empty?
        words = @contents.split
        return words.length
    end

    def reading_time(wpm)
        fail "words per minute must be above 0" unless wpm > 0
        return(count_words / wpm.to_f).ceil
    end

    def reading_chunk(wpm, minutes)
        fail "Reading time must be above 0" unless wpm > 0
        no_words_we_can_read = wpm * minutes
        start_at = @furthest_word
        end_at = no_words_we_can_read + @furthest_word
        words = @contents.split
        chunk = words[start_at, end_at]
        if end_at >= count_words
            @furthest_word = 0
        else 
            @furthest_word = end_at
        end
        return chunk.join(' ')
    end

end