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
    total_ships = @size * 0.25
  
    while self.num_ships < total_ships
    row = rand(0...@grid.length)
    col = rand(0...@grid.length)
    position = [row, col]
    self[position] = :S
    end

  end

  def hidden_ships_grid 
    @grid.map do |subarray|
      subarray.map do |ele|
        if ele == :S
            :N
        else
          ele
        end
      end
    end
  end

  def self.print_grid(grid)
     grid.each do |row| 
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end #Class end
