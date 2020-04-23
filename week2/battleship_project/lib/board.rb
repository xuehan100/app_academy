class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    count = 0
    @grid.each do |ele|
        ele.each do |e|
            if e == :S
                count += 1
            end
        end
    end
    count
  end

  #pay atfention to the use of  [] 
  def attack(pos)
    if self[pos] == :S 
        self[pos] = :H
        puts "you sunk my battle ship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    random_count = @size * 0.25
    while self.num_ships < random_count
        row = rand(0...@grid.length)
        col = rand(0...@grid[0].length)
        pos = [row, col]
        self[pos] = :S 
    end
  end

  #deep copy and chage value of a 2d array
  def hidden_ships_grid
    new_grid = @grid.map do |subarray|
        subarray.map do |ele|
            if ele == :S 
                ele = :N 
            else
                ele
            end
        end 
    end
    new_grid
  end


  def self.print_grid(grid)
    grid.each do |subarray|
        puts subarray.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    #Board.print_grid(Board.hidden_ships_grid)
    Board.print_grid(self.hidden_ships_grid)
  end

end
