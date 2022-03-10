
class LetterCounter
    def initialize(word)
        @text = word
    end
    def calculate_most_common
    counter = Hash.new(0)
    most_common = nil
    most_common_count = 0
    binding.irb
    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char]) + 1
      if counter[char] > most_common_count
        most_common = char
        binding.irb
        most_common_count = counter[char]
        binding.irb
      end
    end
    cl = [most_common_count, most_common]
    binding.irb
    cl
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end

end
counter = LetterCounter.new("Digital Punnnnk")
p counter.calculate_most_common