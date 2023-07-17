require_relative "../piece.rb"

class Knight < Piece

    private
    #metod defining where a Knight can move
    def find_possible_moves
        #figuring out current location indexes
        current_position = find_indexes(@location)
        row_index = current_position[0]
        column_index = current_position[1]
        #all possible king's moves 
        @possible_moves = [
            board.cells[row_index+1][column_index],
            board.cells[row_index+1][column_index+1],
            board.cells[row_index+1][column_index-1],
            board.cells[row_index][column_index+1],
            board.cells[row_index][column_index-1],
            board.cells[row_index-1][column_index],
            board.cells[row_index-1][column_index+1],
            board.cells[row_index-1][column_index-1]
        ]
    end