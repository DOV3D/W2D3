class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.keys.include?(char.upcase)}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "Invalid code"
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    arr = []
      while arr.length < length
          arr << POSSIBLE_PEGS.keys.sample
      end

   Code.new(arr)

  end

  def self.from_string(string)
    arr = string.split("")

    Code.new(arr)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_instance)
    count = 0
    i = 0
    while i < code_instance.length
      count += 1 if code_instance[i] == @pegs[i]
      i += 1
    end
    count
  end

  def num_near_matches(code_i)
    
    copy_pegs = @pegs.dup
    copy_guess = code_i.pegs.dup
    
    (0...copy_pegs.length).each do |i|
      if copy_pegs[i] == copy_guess[i]
          copy_pegs[i] = nil
          copy_guess[i] = nil
      end
    end
      copy_pegs.delete(nil)
      copy_guess.delete(nil)

    count = 0
    copy_guess.each do |char|
      if copy_pegs.include?(char)
        count += 1
        copy_pegs.delete_at(copy_pegs.index(char))
      end
    end
    count
  end

  def ==(code_i)
    self.pegs == code_i.pegs
  end

end #Class End

