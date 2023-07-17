require_relative 'player.rb'

class Piece
    attr_accessor :location, :alive?, :possible_moves, :possible_attacks
    
    def initialize(location, player)
        @color = player.color
        @location = location
        @alive? = true
    end

    private
    def change_location(cell)
        @location = cell
    end

    #required for children of that class: 
        #find_possible_moves
        #find_possible_attacks
        #move
        #attack
end