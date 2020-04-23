# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.
def peak_finder(arr) 
    res = []
    #edge case
    if arr.length <= 1
        return arr
    end
    
    if arr.length == 2
        res << arr.max
        return arr
    end
    
    #arr length larger than 2
    arr.each_with_index do |ele, i|
        if i == 0
            if ele > arr[i + 1]
                res << ele
            end
        elsif i == arr.length - 1
            if ele > arr[i - 1]
                res << ele
            end
        else
            if ele > arr[i  - 1] && ele > arr[ i + 1]
                res << ele
            end
        end
    end
    res

end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
