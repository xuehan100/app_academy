class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end


    def my_select(&prc)
        selected = []
        self.my_each do |ele|
            if prc.call(ele)
                selected << ele
            end
        end
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |ele|
            if !prc.call(ele)
                rejected << ele
            end
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        return true
    end

    def my_flatten
        flattened = []
        self.my_each do |subarr|
            #if !subarr.is_a?
            if !subarr.is_a?(Array)
                flattened << subarr
            else
                #flattened.concat(my_flatten.subarr) is wrong, expected 0 argument
                flattened.concat(subarr.my_flatten)
            end
        end
        flattened
    end

    def my_zip(*args)


    end

    def my_rotate(num = 1)
        arr = []
        len = self.length;
        if num > 0
            arr = self[num % len...len] + self[0...num % len]
        else
            num = (num).abs % len
            arr = self[len - num...len] + self[0...len - num]
        end
    end

    def my_join(str='')
        self.join(str)
    end

    def my_reverse
        arr = []
        self.my_each do |ele|
            arr.unshift(ele)
        end
        arr
    end
        

end


