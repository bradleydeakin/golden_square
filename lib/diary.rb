def make_snippet(str)
    words = str.split
    if words.length >= 5
        sentence = words[0, 5] 
       return sentence.join(" ") + " ..."
    else
        return str
    end
end

def count_words(str)
    words = str.split
    return words.length
end



