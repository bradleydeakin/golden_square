require "diary_entry"
class Diary 

    def initialize
        @diary = []
        @contacts = []
    end

    def entries
        return @diary
    end

    def add(entry)
        @diary << entry
    end

    def add_contact(contact)
        @contacts << contact
    end

    def contacts
        return @contacts
    end

    def count_words
        return @diary.map do |entries|
            entries.count_words
        end.sum
    end

    def reading_time(wpm)
        fail "words per minute must be above 0" unless wpm > 0
        return (count_words / wpm.to_f).ceil
    end

    def finding_best_entry_for_reading_time(wpm, minutes)
        fail "wpm must be above 0" unless wpm > 0
        readable_entries = @diary.filter do |entry|
            entry.reading_time(wpm) <= minutes
        end
        sorted_by_length = readable_entries.sort_by do |entry|
            entry.count_words
        end
        return sorted_by_length.last
    end


end