require_relative '../player.rb'
require_relative "../piece.rb"
require_relative "../board.rb"

class Rook < Piece
    attr_reader :name, :symbol

    def initialize(location, player, board)
        super
        @name = "Rook"
        @symbol = @symbol = @color == "White" ? "♖" : "♜"
    end

    #metod defining where a rook can move
    def find_possible_moves
        #figuring out current location indexes
        current_position = @board.find_indexes(@location)
        row_index = current_position[0]
        column_index = current_position[1]
        #all possible rook's moves 
        @possible_moves = []
        
        #travel each possible direction (up, dowb, right, left)
        add_valid_moves_from_line(row_index, column_index) do |row, column| 
            row += 1
            [row, column]
        end
        add_valid_moves_from_line(row_index, column_index) do |row, column| 
            row -= 1
            [row, column]
        end
        add_valid_moves_from_line(row_index, column_index) do |row, column| 
            column += 1
            [row, column]
        end
        add_valid_moves_from_line(row_index, column_index) do |row, column| 
            column -= 1
            [row, column]
        end
        @possible_moves
    end
end