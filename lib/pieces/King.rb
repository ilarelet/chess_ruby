require_relative '../player.rb'
require_relative "../piece.rb"
require_relative "../board.rb"

class King < Piece
    attr_reader :name

    def initialize(location, player, board)
        super
        @name = "King"
    end

    private
    #metod defining where a King can move
    def find_possible_moves
        #figuring out current location indexes
        current_position = @board.find_indexes(@location)
        row_index = current_position[0]
        column_index = current_position[1]
        #all possible king's moves 
        @possible_moves = []
        add_valid_move(row_index+1, column_index-1)
        add_valid_move(row_index+1, column_index)
        add_valid_move(row_index+1, column_index+1)
        add_valid_move(row_index, column_index-1)
        add_valid_move(row_index, column_index+1)
        add_valid_move(row_index-1, column_index-1)
        add_valid_move(row_index-1, column_index)
        add_valid_move(row_index-1, column_index+1)
    end
end