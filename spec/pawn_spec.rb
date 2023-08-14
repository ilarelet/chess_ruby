require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/pieces/pawn.rb'
require 'rspec'

describe Pawn do
    subject(:board_1) {Board.new}
    subject(:player_1) {Player.new('White')}
    subject(:player_2) {Player.new('Black')}
    subject(:pawn_white) {described_class.new('e2', player_1, board_1)}
    subject(:pawn_black) {described_class.new('e6', player_2, board_1)}

    describe '#move' do
        context 'Moving a white pawn from e2' do
            it 'Moves successfully to a row ahead (e3)' do
                pawn_white.move('e3')
                expect(pawn_white.location).to eql(board_1.cell('e3'))
            end

            it 'Move to f3 is not allowed' do
                expect {pawn_white.move('f3')}.to raise_error(ArgumentError)
            end

            it 'Move two steps ahead from row 2 is allowed' do
                pawn_white.move('e4')
                expect(pawn_white.location).to eql(board_1.cell('e4'))
            end

            it 'Move to e1 is not allowed' do
                expect {pawn_white.move('e1')}.to raise_error(ArgumentError)
            end          
            
            it 'Move to a f3 is allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('f3', player_2, board_1)
                pawn_white.move('f3')
                expect(pawn_white.location).to eql(board_1.cell('f3'))
            end
            
            it 'Move to a d3 is allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('d3', player_2, board_1)
                pawn_white.move('d3')
                expect(pawn_white.location).to eql(board_1.cell('d3'))
            end
            
            it 'Move to a e3 is not allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('e3', player_2, board_1)
                expect {pawn_white.move('e3')}.to raise_error(ArgumentError)
            end            
            
            it 'Move to a d3 is not allowed if it\'s occupied by a piece of the same color' do
                another_piece = described_class.new('d3', player_1, board_1)
                expect {pawn_white.move('d3')}.to raise_error(ArgumentError)
            end
        end

        
        context 'Moving a black pawn from e6' do
            it 'Moves successfully to a row ahead (e5)' do
                pawn_black.move('e5')
                expect(pawn_black.location).to eql(board_1.cell('e5'))
            end

            it 'Move to f5 is not allowed' do
                expect {pawn_black.move('f5')}.to raise_error(ArgumentError)
            end

            it 'Move two steps ahead from row 6 is not allowed' do
                expect {pawn_black.move('e4')}.to raise_error(ArgumentError)
            end

            it 'Move to e7 is not allowed' do
                expect {pawn_black.move('e7')}.to raise_error(ArgumentError)
            end          
            
            it 'Move to a f5 is allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('f5', player_1, board_1)
                pawn_black.move('f5')
                expect(pawn_black.location).to eql(board_1.cell('f5'))
            end
            
            it 'Move to a d5 is allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('d5', player_1, board_1)
                pawn_black.move('d5')
                expect(pawn_black.location).to eql(board_1.cell('d5'))
            end
            
            it 'Move to a e5 is not allowed if it\'s occupied by a piece of another color' do
                another_piece = described_class.new('e5', player_1, board_1)
                expect {pawn_black.move('e5')}.to raise_error(ArgumentError)
            end            
            
            it 'Move to a d5 is not allowed if it\'s occupied by a piece of the same color' do
                another_piece = described_class.new('d5', player_2, board_1)
                expect {pawn_black.move('d5')}.to raise_error(ArgumentError)
            end
        end

    end
end
