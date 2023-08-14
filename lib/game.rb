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
        King.new('d8', @player_2, @board)
        Queen.new('e8', @player_2, @board)
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

end