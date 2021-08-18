class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    count = 0
    @grid.each do |subarray|
        subarray.each do |ele|
          count += 1 if ele == :S
        end
    end
    count
  end

  def attack(position)
    if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship!"
        true
    else
        self[position] = :X
        false
    end
  end


  def place_random_ships
    
  end


end #Class end
