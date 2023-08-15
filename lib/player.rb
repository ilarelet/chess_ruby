class Player
    attr_reader :color, :pieces 
    def initialize(color)
        @color = color
        @pieces = Array.new()
    end

    def add_piece(piece)
        @pieces.append piece
    end

    def delete_piece(piece)
        @pieces.delete piece
    end
end