class Player
    attr_reader :color, :pieces 
    def initialize(color)
        @color = color
        @pieces = Array.new(
            #add pieces
        )
    end
end