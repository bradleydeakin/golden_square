def check_grammar(str)
    words = str.split(//)
    if words[0] == words[0].upcase && words.last == "."
        return true
    else
        return false
    end
end