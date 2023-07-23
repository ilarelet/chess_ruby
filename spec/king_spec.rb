require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/pieces/king.rb'
require 'rspec'

describe King do
    subject(:board_1) {Board.new}
    subject(:player_1) {Player.new('Black')}
    subject(:king_1) {described_class.new('e1', player_1, board_1)}

    describe '#move' do
        context 'Moving to a neighboring cell from e1' do
            it 'Moves successfully to d2' do
                king_1.move('d2')
                expect(king_1.location).to eql(board_1.cell('D2'))
            end
            
            it 'Moves successfully to f1' do
                king_1.move('f1')
                expect(king_1.location).to eql(board_1.cell('F1'))
            end
            
            it 'Moves successfully to e2' do
                king_1.move('e2')
                expect(king_1.location).to eql(board_1.cell('E2'))
            end
            
            it 'Move to c1 is not allowed' do
                expect {king_1.move('c1')}.to raise_error(ArgumentError)
            end
            
            it 'Move to e8 (off the board edge) is not allowed' do
                expect {king_1.move('e8')}.to raise_error(ArgumentError)
            end
        end
        
        context 'Moving to a neighboring cell from a1' do
            subject(:king_1) {described_class.new('a1', player_1, board_1)}

            it 'Moves successfully to a2' do
                king_1.move('a2')
                expect(king_1.location).to eql(board_1.cell('A2'))
            end

            it 'Moves successfully to b2' do
                king_1.move('b2')
                expect(king_1.location).to eql(board_1.cell('b2'))
            end

            it 'Moves successfully to b1' do
                king_1.move('b1')
                expect(king_1.location).to eql(board_1.cell('b1'))
            end

            it 'Move to a8 (off the board edge) is not allowed' do
                expect {king_1.move('a8')}.to raise_error(ArgumentError)
            end            

            it 'Move to h1 (off the board edge) is not allowed' do
                expect {king_1.move('h1')}.to raise_error(ArgumentError)
            end
        end
    end
end

    #puts "moved!"
    #king1.find_possible_moves
    #puts "current location: #{board1.find_indexes(king1.location)}!"
    #puts "possible loactions:"
    #king1.possible_moves.each {|cell| p board1.find_indexes(cell)}