require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'


board = Board.new
player_1 = Player.new('White')
player_2 = Player.new('Black')
game = Game.new(board, player_1, player_2)

game.create_pieces
board.display
until player_1.lost or player_2.lost
    game.take_turn(player_1)
    break if player_1.lost or player_2.lost
    game.take_turn(player_2)
end