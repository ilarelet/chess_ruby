require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/pieces/rook.rb'
require 'rspec'

describe Rook do
    subject(:board_1) {Board.new}
    subject(:player_1) {Player.new('Black')}
    subject(:player_2) {Player.new('White')}
    subject(:rook_1) {described_class.new('e1', player_1, board_1)}

    describe '#move' do 
        context 'Moving away from e1' do           
            it 'Moves successfully to f1' do
                rook_1.move('f1')
                expect(rook_1.location).to eql(board_1.cell('F1'))
            end        

            it 'Moves successfully to h1' do
                rook_1.move('h1')
                expect(rook_1.location).to eql(board_1.cell('h1'))
            end
            
            it 'Moves successfully to e8' do
                rook_1.move('e8')
                expect(rook_1.location).to eql(board_1.cell('e8'))
            end
            
            it 'Moves successfully to a1' do
                rook_1.move('a1')
                expect(rook_1.location).to eql(board_1.cell('a1'))
            end

            it 'Moves successfully to e2' do
                rook_1.move('e2')
                expect(rook_1.location).to eql(board_1.cell('E2'))
            end
            
            it 'Move to a e2 is not allowed if it\'s occupied by another piece of the same color' do
                another_piece = described_class.new('e2', player_1, board_1)
                expect {rook_1.move('e2')}.to raise_error(ArgumentError)
            end
            
            it 'Move to a e2 is allowed if it\'s occupied by another piece of another color' do
                another_piece = described_class.new('e2', player_2, board_1)
                rook_1.move('e2')
                expect(rook_1.location).to eql(board_1.cell('E2'))
            end
            
            it 'Move to a e8 is not allowed if e2 is occupied by another piece' do
                another_piece = described_class.new('e2', player_2, board_1)
                expect {rook_1.move('e8')}.to raise_error(ArgumentError)
            end

            it 'Move to c5 is not allowed' do
                expect {rook_1.move('c5')}.to raise_error(ArgumentError)
            end
            
            it 'Move to f2 is not allowed' do
                expect {rook_1.move('f2')}.to raise_error(ArgumentError)
            end
        end
    end
end