require_relative 'player.rb'
require_relative "../board.rb"

class Piece
    attr_accessor :location, :alive, :possible_moves, :possible_attacks
    
    def initialize(location, player)
        @color = player.color
        @location = location
        @alive = true
    end

    def killed_message
        puts "#{@color}'s #{@name} was defeated!"
    end

    #move to the new_cell (where new_cell is an alphanumerical code)
    def move(new_cell)
        #Check if new_cell is in the list of possible moves
        unless @possible_moves.index(board.cell(new_cell))
            puts "That move is not allowed!"
            return
        end

        #if the cell is not empty the figure standing them gets "eaten"
        unless board.cell(new_cell) == nil
            board.cell(new_cell).alive = false
            board.cell(new_cell).killed_message
        end

        #changing the location of the piece and emptying the old cell is done with a separate method
        self.change_location(new_cell)
    end

    private
    #update location with an alphanumerical code
    def change_location(cell_code)
        #free the previous location
        update_cell(@location, nil)
        #move to the new location
        @location = Board.cell(cell_code)
        update_cell(cell_code, self)
    end

    #required for children of that class: 
        #find_possible_moves
        #find_possible_attacks
        #move
        #attack
end