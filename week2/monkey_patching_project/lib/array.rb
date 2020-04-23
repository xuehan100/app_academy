# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0
        return nil
    else
        return self.max - self.min
    end
  end

  def average
    if self.length == 0
        return nil
    else
        return self.sum / (self.length * 1.0)
    end
  end

  def median
    len = self.length
    
    if len == 0
        return nil
    elsif len % 2 == 1
        return self.sort[len / 2]
    else
        return (self.sort[len / 2] + self.sort[len / 2 - 1]) / (2 * 1.0)
    end
  end

  def counts
    hash = Hash.new(0)
    self.each do |ele|
        hash[ele] += 1
    end
    hash
  end

def my_count(val)
    count = 0
    self.each do |ele|
        if ele == val
            count += 1
        end
    end
    count
end

def my_index(val)
    self.each_with_index do |ele, i|
        if ele == val
            return i 
        end
    end
    return nil
end

def my_uniq
    new_arr = []
    self.each do |ele|
        if !new_arr.include?(ele)
            new_arr << ele
        end
    end
    new_arr
end

def my_transpose
    i = 0
    len = self.length
    while i < len
        j = i + 1
        while j < len
            self[i][j], self[j][i] = self[j][i], self[i][j]
            j += 1
        end
        i += 1
    end
    self
end

end 
