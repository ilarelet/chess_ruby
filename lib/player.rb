class Player
    attr_reader :color, :pieces, :lost
    def initialize(color)
        @color = color
        @pieces = Array.new()
        @lost = false
    end

    def add_piece(piece)
        @pieces.append piece
    end

    def delete_piece(piece)
        @pieces.delete piece
    end

    def lose_game
        @lost = true
        puts "#{@color} king is defeated! Player #{@color} lost the game!"
    end
end