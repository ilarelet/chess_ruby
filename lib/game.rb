require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/pieces/Bishop.rb'
require_relative '../lib/pieces/King.rb'
require_relative '../lib/pieces/knight.rb'
require_relative '../lib/pieces/Pawn.rb'
require_relative '../lib/pieces/Queen.rb'
require_relative '../lib/pieces/Rook.rb'

class Game

    def initialize(board, player_1, player_2)
        puts 'Starting a new game... '
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def create_pieces
        #Creating white pieces
        Rook.new('a1', @player_1, @board)
        Knight.new('b1', @player_1, @board)
        Bishop.new('c1', @player_1, @board)
        Queen.new('d1', @player_1, @board)
        King.new('e1', @player_1, @board)
        Bishop.new('f1', @player_1, @board)
        Knight.new('g1', @player_1, @board)
        Rook.new('h1', @player_1, @board)
        Pawn.new('a2', @player_1, @board)
        Pawn.new('b2', @player_1, @board)
        Pawn.new('c2', @player_1, @board)
        Pawn.new('d2', @player_1, @board)
        Pawn.new('e2', @player_1, @board)
        Pawn.new('f2', @player_1, @board)
        Pawn.new('g2', @player_1, @board)
        Pawn.new('h2', @player_1, @board)

        #Creating black pieces
        Rook.new('a8', @player_2, @board)
        Knight.new('b8', @player_2, @board)
        Bishop.new('c8', @player_2, @board)
        Queen.new('d8', @player_2, @board)
        King.new('e8', @player_2, @board)
        Bishop.new('f8', @player_2, @board)
        Knight.new('g8', @player_2, @board)
        Rook.new('h8', @player_2, @board)
        Pawn.new('a7', @player_2, @board)
        Pawn.new('b7', @player_2, @board)
        Pawn.new('c7', @player_2, @board)
        Pawn.new('d7', @player_2, @board)
        Pawn.new('e7', @player_2, @board)
        Pawn.new('f7', @player_2, @board)
        Pawn.new('g7', @player_2, @board)
        Pawn.new('h7', @player_2, @board)
    end

    def make_move(cell_from, cell_to)
        @board.cell(cell_from).figure.move(cell_to)
    end

    def take_turn(player)
        begin
            #Choosing a piece to move
            puts "Player #{player.color}, choose a piece to make a turn: "
            cell_from = gets.chomp
            if @board.cell(cell_from).figure.color != player.color
                puts "This is not your figure"
                raise
            end
            #Choosing a target cell
            puts 'Enter a cell to move to or enter "back" to choose another piece: '
            cell_to = gets.chomp
            if cell_to.downcase == 'back'
                raise
            end
            self.make_move(cell_from, cell_to)
        rescue
            puts "Enter a correct cell code!"
            retry
        end

        @board.display
        
        if check_for_check(@player_1, @player_2) or check_for_check(@player_2, @player_1)
            puts "CHECK!"
            check
        end
    end          

    def check_for_check(player_a, player_b)
        #targeting king of the other player
        enemy_king = player_b.pieces.find {|piece| piece.name == "King"}
        #Checking if the targeted king is under attack of one of player_a's pieces
        player_a.pieces.each do |piece|
            possible_moves = piece.find_possible_moves
            if possible_moves != nil and possible_moves.include? enemy_king.location 
                return true
            end
        end
    end
end