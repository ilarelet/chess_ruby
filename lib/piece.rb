require_relative 'player.rb'
require_relative "board.rb"

class Piece
    attr_accessor :location, :alive, :possible_moves, :possible_attacks
    
    def initialize(location, player, board)
        @color = player.color
        @alive = true
        @board = board
        @location = @board.cell(location)
    end

    def killed_message
        puts "#{@color}'s #{@name} was defeated!"
    end

    #move to the new_cell (where new_cell is an alphanumerical code)
    def move(new_cell)
        self.find_possible_moves
        #Check if new_cell is in the list of possible moves
        unless @possible_moves.index(@board.cell(new_cell))
            raise ArgumentError.new "That move is not allowed!"
        end

        #if the cell is not empty the figure standing them gets "eaten"
        unless @board.cell(new_cell) == nil
            #@board.cell(new_cell).figure.alive = false
            #@board.cell(new_cell).figure.killed_message
        end

        #changing the location of the piece and emptying the old cell is done with a separate method
        self.change_location(new_cell)
    end

    private
    #update location with an alphanumerical code
    def change_location(cell_code)
        #free the previous location
        @board.update_cell(@location, nil)
        #move to the new location
        @location = @board.cell(cell_code)
        @board.update_cell(@location, self)
    end

    #The method adds a possible move to the list only if it doesn't exceed the board
    def add_valid_move(row, column)
        unless (column < 0) or (column > 7) or (row < 0) or (row > 7)
            @possible_moves.append @board.cells[row][column]
        end
    end

    #required for children of that class: 
        #find_possible_moves
        #find_possible_attacks
end