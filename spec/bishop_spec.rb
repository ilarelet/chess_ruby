require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/pieces/bishop.rb'
require 'rspec'

describe Bishop do
    subject(:board_1) {Board.new}
    subject(:player_1) {Player.new('Black')}
    subject(:player_2) {Player.new('White')}
    subject(:bishop_1) {described_class.new('e3', player_1, board_1)}

    describe '#move' do 
        context 'Moving away from e3' do           
            it 'Moves successfully to f2' do
                bishop_1.move('f2')
                expect(bishop_1.location).to eql(board_1.cell('F2'))
            end        

            it 'Moves successfully to h6' do
                bishop_1.move('h6')
                expect(bishop_1.location).to eql(board_1.cell('h6'))
            end
            
            it 'Moves successfully to a7' do
                bishop_1.move('a7')
                expect(bishop_1.location).to eql(board_1.cell('a7'))
            end

            it 'Moves successfully to c1' do
                bishop_1.move('c1')
                expect(bishop_1.location).to eql(board_1.cell('c1'))
            end
            
            it 'Moves successfully to b6' do
                bishop_1.move('b6')
                expect(bishop_1.location).to eql(board_1.cell('b6'))
            end
            
            it 'Move to a b6 is not allowed if it\'s occupied by another piece of the same color' do
                another_piece = described_class.new('b6', player_1, board_1)
                expect {bishop_1.move('b6')}.to raise_error(ArgumentError)
            end
            
            it 'Move to a b6 is allowed if it\'s occupied by another piece of another color' do
                another_piece = described_class.new('b6', player_2, board_1)
                bishop_1.move('b6')
                expect(bishop_1.location).to eql(board_1.cell('b6'))
            end
            
            it 'Move to a a7 is not allowed if b6 is occupied by another piece' do
                another_piece = described_class.new('b6', player_2, board_1)
                expect {bishop_1.move('a7')}.to raise_error(ArgumentError)
            end

            it 'Move to c4 is not allowed' do
                expect {bishop_1.move('c4')}.to raise_error(ArgumentError)
            end
            
            it 'Move to f7 is not allowed' do
                expect {bishop_1.move('f7')}.to raise_error(ArgumentError)
            end
        end
    end
end