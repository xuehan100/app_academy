require "byebug"

def strange_sums(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    count = 0
    arr.each do |ele|
        if hash[0 - ele] != 0
            count += 1
        end
    end
    return count / 2
end


def pair_product(arr, product)
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j > i && ele1 * ele2 == product
                return true
            end
        end
    end
    false
end

def rampant_repeats(str, hash) 
    #debugger
    new_str = ""
    str.each_char do |char|
        if !hash.has_key?(char)
            new_str += char
        else 
            #ew_str += hash[char] * char
            new_str += char * hash[char]
        end
    end
    new_str
end


