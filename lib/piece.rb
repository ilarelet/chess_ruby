require_relative 'player.rb'

class Piece
    attr_accessor :location, :alive?
    
    def initialize(location, player)
        @color = player.color
        @location = location
        @alive? = true
    end

end