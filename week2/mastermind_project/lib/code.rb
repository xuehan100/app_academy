class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    return arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  #pay attention
  def initialize(arr)
    if Code.valid_pegs?(arr)
      #@pegs = arr.map {|ele| ele.upcase}
      @pegs = arr.map(&:upcase)
    else
      raise "Not valid input array"
    end
  end

  def pegs
    @pegs
  end

  def self.random(len)
    #should call Code::new with an array of the given length containing random pegs
    random_pegs = Array.new(len) {POSSIBLE_PEGS.keys.sample}
    self.new(random_pegs)
  end

  def self.from_string(pegs_string)
    pegs_arr = pegs_string.split("")
    self.new(pegs_arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |ele, i|
      if @pegs[i] == ele
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |ele, i|
      if @pegs.include?(ele) && @pegs[i] != ele
        count += 1
      end
    end
    count
  end

  def ==(guess)
    return guess.pegs.length == @pegs.length && num_exact_matches(guess) == @pegs.length
  end


end
