def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0 
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1...word.length]
        end
        i -= 1
    end
    return word

end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char do |ele|
        if vowels.include?(ele)
            hash[ele] += 1
        end
    end
    hash
end

def caesar_cipher(message, n)
  alphabet = ("a".."z").to_a
  new_message = ""

  message.each_char do |char|
    old_idx = alphabet.index(char)
    if old_idx == nil
      new_message += char
    else
      new_idx = old_idx + n
      new_message += alphabet[new_idx % 26]
    end
  end

  new_message
end
        