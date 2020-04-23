def reverser(str, &prc)
    new_str = prc.call(str.reverse)
    new_str
end

def word_changer(sentence, &prc)
    words = sentence.split(" ")
    new_word = []
    words.each do |word|
        new_word << prc.call(word)
    end
    new_word.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    res1 = prc1.call(num)
    res2 = prc2.call(num)
    if res1 >= res2
        return res1
    else
        return res2
    end
end

def and_selector(arr, prc1, prc2) 
    new_arr = []
    arr.each do |ele|
        if prc1.call(ele) && prc2.call(ele)
            new_arr << ele 
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i % 2 == 0
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end