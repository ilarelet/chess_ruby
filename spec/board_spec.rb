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
    end
end