def average(num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(nums)
    return nums.sum / nums.length.to_f
end

def repeat (str, num)
    res = ""
    num.times {res += str}
    return res
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    res = []
    arr.each_with_index do |ele, i|
        if (i % 2 == 0)
            res << ele.upcase
        else
            res << ele.downcase
        end
    end
    return res.join(" ")
end