require_relative '../player.rb'
require_relative "../piece.rb"
require_relative "../board.rb"

class Pawn < Piece
    attr_reader :name, :symbol

    def initialize(location, player, board)
        super
        @name = "Pawn"
        @symbol = "p"
    end

    private
    #metod defining where a pawn can move
    def find_possible_moves
        #figuring out current location indexes
        current_position = @board.find_indexes(@location)
        row = current_position[0]
        column = current_position[1]

        #all possible pawn's moves 
        @possible_moves = []

        #White pawns move forward, black pawns move backwards
        row_ahead = @color == "White" ? row + 1 : row - 1
        row_two_ahead = @color == "White" ? row + 2 : row - 2

        #Checking if move forward is allowed
        if @board.cells[row_ahead][column].figure == nil
            @possible_moves.append @board.cells[row_ahead][column]

            #From the second row it's possible to go two steps ahead
            if (@color == "White" and row == 1) or (@color == "Black" and row == 6)
                if @board.cells[row_two_ahead][column].figure == nil
                    @possible_moves.append @board.cells[row_two_ahead][column]
                end
            end
        end

        #checking if attacks are allowed
        if @board.cells[row_ahead][column + 1].figure != nil and @board.cells[row_ahead][column + 1].figure.color != @color
            @possible_moves.append @board.cells[row_ahead][column + 1]
        end
        if @board.cells[row_ahead][column - 1].figure != nil and @board.cells[row_ahead][column - 1].figure.color != @color
            @possible_moves.append @board.cells[row_ahead][column - 1]
        end
    end
end