require_relative 'player.rb'
require_relative "board.rb"

class Piece
    attr_accessor :location, :alive, :possible_moves, :possible_attacks, :color
    
    def initialize(location, player, board)
        @color = player.color
        @alive = true
        @board = board
        @location = @board.cell(location)
        @board.update_cell(@location, self)
        player.add_piece(self)
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

        #if the cell is not empty the figure standing there gets "eaten"
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
            if @board.cells[row][column].figure == nil or @board.cells[row][column].figure.color != @color
                @possible_moves.append @board.cells[row][column]
            end
        end
    end

    #method traversing a line for possible moves (REQUIRES A BLOCK defining a line)
    def add_valid_moves_from_line(row, column)
        row, column = yield row, column 
        while (column >= 0) and (column <= 7) and (row >= 0) and (row <= 7)
            if @board.cells[row][column].figure == nil
                @possible_moves.append @board.cells[row][column]
            else
                if @board.cells[row][column].figure.color != @color
                    @possible_moves.append @board.cells[row][column]
                end
                break
            end
            row, column = yield row, column 
        end 
    end
end