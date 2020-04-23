# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num) 
    num.downto(2).each do |factor|
        if num % factor == 0 && isPrime(factor)
            return factor
        end
    end
end

def isPrime(num)
    return false if num < 2
    (2...num).none? {|ele| num % ele == 0}
end

def unique_chars?(str)
    map = Hash.new(0)
    str.each_char {|c| map[c] += 1}
    map.each_value.none? {|val| val > 1}
end

def dupe_indices(arr)
    hash = Hash.new { |h, k|  h[k]= Array.new }
    arr.each_with_index do |ele, i|
        hash[ele].push(i)
    end
    hash = hash.select {|k, v| v.length > 1}

end

def ana_array(arr1, arr2) 
    if arr1.length != arr2.length
        return false
    end
    arr1.all? {|ele| arr2.include?(ele)} && arr2.all? {|ele| arr1.include?(ele)}

end