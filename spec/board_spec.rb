require_relative '../lib/board.rb'
require 'rspec'

describe Board do
    subject(:board_1) {described_class.new}

    describe '#cell' do
        context 'If a valid cell is given' do
            it 'returns cell c5' do
                index = 'c5'
                cell = board_1.cell(index)
                expect(cell).to equal(board_1.cells[4][2])
            end
            
            it 'returns cell A1' do
                index = 'A1'
                cell = board_1.cell(index)
                expect(cell).to equal(board_1.cells[0][0])
            end
        end

        context 'If an invalid cell is given' do
            it 'raises error if the index is too long' do
                index = 'b53'
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end
            
            it 'raises error if the index is not given' do
                index = ''
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end
            
            it 'raises error if the row is 0' do
                index = 'd0'
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end

            it 'raises error if the row is more than 8' do
                index = 'e9'
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end

            it 'raises error if the column doesn\'t exist' do
                index = 'i6'
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end


            it 'raises error if the column code is a number' do
                index = '36'
                expect {board_1.cell(index)}.to raise_error(ArgumentError)
            end
        end
    end
end