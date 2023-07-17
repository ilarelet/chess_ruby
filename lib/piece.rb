require_relative 'player.rb'

class Piece
    attr_accessor :location, :alive?, :possible_moves, :possible_attacks
    
    def initialize(location, player)
        @color = player.color
        @location = location
        @alive? = true
    end

    private
    #update location with an alphanumerical code
    def change_location(cell_code)
        @location = Board.cell(cell_code)
    end

    #required for children of that class: 
        #find_possible_moves
        #find_possible_attacks
        #move
        #attack
end