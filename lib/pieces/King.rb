require_relative "../piece.rb"

class Knight < Piece

    def initialize
        @name = "King"
    end

    #move to new_cell (where new_cell is an alphanumerical code)
    def move(new_cell)
        #if the cell is not empty the figure
        unless board.cell(new_cell) = nil
            board.cell(new_cell).alive? = false
            board.cell(new_cell).killed_message
        end

    end

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