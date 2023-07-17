require_relative 'cell.rb'

class Board
    attr_reader :cells

    def initialize #creating a board of 64 empty cells
        @cells = Array.new(8) {Array.new(8) {Cell.new(nil)}}
    end

    #A method to print out the board to the console
    def display
        # First we need to display a "header" of the board for players' convenience
        print "Row: "
        ('A'..'H').to_a.each {|column| print " #{column}   "}
        puts
        # Then the board gets printed line by line
        @cells.each_with_index do |row, index| 
            p "#{index+1}: #{row}"
        end
    end 

    
    #This method finds row and column indexes of a given cell
    def find_indexes(cell)
        @cells.each_with_index do |row, row_index|
            column_index = row.index(cell)
            if column_index
                return [row_index, column_index]
            end
        end
        nil
    end
    
    #a method to access an exact cell by it's alphanumerical code
    def cell(cell_code)
        unless cell_code.length == 2 and cell_code[0].match /[A-Ha-h]/ and cell_code[1].match /[1-8]/
            raise ArgumentError.new "Incorrect cell index"
        end
        #read the letter and number parts of the cell code
        letter_code = cell_code[0]
        num_code = cell_code[1].to_i
        #translate a letter code of the column to the column index
        column_index = letter_code.upcase.ord - 65
        #get a row index from the number code
        row_index = num_code - 1
        #return the row and column index of the cell
        indexes = [row_index, column_index]
        #return the requested cell
        @cells[indexes[0]][indexes[1]]
    end
end