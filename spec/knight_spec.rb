require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/pieces/knight.rb'
require 'rspec'

describe Knight do
    subject(:board_1) {Board.new}
    subject(:player_1) {Player.new('Black')}
    subject(:knight_1) {described_class.new('b1', player_1, board_1)}
    subject(:knight_2) {described_class.new('d4', player_1, board_1)}

    describe '#move' do
        context 'Moving away from b1' do
            it 'Moves successfully to a3' do
                knight_1.move('a3')
                expect(knight_1.location).to eql(board_1.cell('a3'))
            end
            
            it 'Moves successfully to d2' do
                knight_1.move('d2')
                expect(knight_1.location).to eql(board_1.cell('d2'))
            end
            
            it 'Moves successfully to c3' do
                knight_1.move('c3')
                expect(knight_1.location).to eql(board_1.cell('c3'))
            end

            it 'Move to c3 is not allowed if it\'s occupied by another knight' do
                knight_another = described_class.new('c3', player_1, board_1)
                expect {knight_1.move('c3')}.to raise_error(ArgumentError)
            end
            
            it 'Move to c1 is not allowed' do
                expect {knight_1.move('c1')}.to raise_error(ArgumentError)
            end
            
            it 'Move to b2 is not allowed' do
                expect {knight_1.move('b2')}.to raise_error(ArgumentError)
            end
        end

        
        context 'Moving away from d4' do
            
            it 'Moves successfully to e6' do
                knight_2.move('e6')
                expect(knight_2.location).to eql(board_1.cell('e6'))
            end
            
            it 'Moves successfully to f5' do
                knight_2.move('f5')
                expect(knight_2.location).to eql(board_1.cell('f5'))
            end
            
            it 'Moves successfully to f3' do
                knight_2.move('f3')
                expect(knight_2.location).to eql(board_1.cell('f3'))
            end

            it 'Moves successfully to e2' do
                knight_2.move('e2')
                expect(knight_2.location).to eql(board_1.cell('e2'))
            end

            it 'Moves successfully to c2' do
                knight_2.move('c2')
                expect(knight_2.location).to eql(board_1.cell('c2'))
            end

            it 'Moves successfully to b3' do
                knight_2.move('b3')
                expect(knight_2.location).to eql(board_1.cell('b3'))
            end

            it 'Moves successfully to b5' do
                knight_2.move('b5')
                expect(knight_2.location).to eql(board_1.cell('b5'))
            end

            it 'Moves successfully to c6' do
                knight_2.move('c6')
                expect(knight_2.location).to eql(board_1.cell('c6'))
            end
            
            it 'Move to a c6 is not allowed if it\'s occupied by another knight' do
                knight_another = described_class.new('c3', player_1, board_1)
                expect {knight_2.move('c3')}.to raise_error(ArgumentError)
            end
            
            it 'Move to a random cell (a7) is not allowed' do
                expect {knight_2.move('a7')}.to raise_error(ArgumentError)
            end

            it 'Move to a random cell (e4) is not allowed' do
                expect {knight_2.move('e4')}.to raise_error(ArgumentError)
            end
        end
    end
end