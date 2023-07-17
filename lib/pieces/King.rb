require_relative '../player.rb'
require_relative "../piece.rb"
require_relative "../board.rb"

class King < Piece

    def initialize(location, player, board)
        super
        @name = "King"
    end

    #private
    #metod defining where a Knight can move
    def find_possible_moves
        #figuring out current location indexes
        current_position = @board.find_indexes(@location)
        row_index = current_position[0]
        column_index = current_position[1]
        #all possible king's moves 
        @possible_moves = [
            @board.cells[row_index+1][column_index],
            @board.cells[row_index+1][column_index+1],
            @board.cells[row_index+1][column_index-1],
            @board.cells[row_index][column_index+1],
            @board.cells[row_index][column_index-1],
            @board.cells[row_index-1][column_index],
            @board.cells[row_index-1][column_index+1],
            @board.cells[row_index-1][column_index-1]
        ]
    end
end