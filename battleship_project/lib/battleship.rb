require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n * n / 2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
       if @remaining_misses <= 0
        puts "you lose"
        true
       else
        false
       end
    end

    def win?
       if @board.num_ships == 0
        puts "you win"
        true
       else
        false
       end
    end

    def game_over?
        if win? || lose?
            true
        else
            false
        end
    end

    def turn
      response = @player.get_move
        if !@board.attack(response)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end
end
