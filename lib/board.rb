class Board
    #attr_reader :cells

    def initialize
        @cells = Array.new(8) {Array.new(8, nil)}
    end

    def display
        print "Row: "
        ('A'..'H').to_a.each {|column| print " #{column}   "}
        puts
        @cells.each_with_index do |row, index| 
            p "#{index+1}: #{row}"
        end
    end 
end

board = Board.new()
board.display