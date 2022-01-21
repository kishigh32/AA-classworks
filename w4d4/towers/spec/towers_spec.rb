require 'rspec'
require 'towers'

describe Towers do
  let (:game) { Towers.new }
  describe '#initialize' do
    it 'it should create an array with 3 sub_arrays (pegs)' do
      expect(game.pegs.length).to eq(3)
    end

    it 'it should not set pegs in order' do 
      expect(game.pegs.flatten).to_not eq([1, 2, 3, 4, 5])
    end
  end

  describe '#add_pegs' do 
    it 'it should add pegs to the sub_arrays' do 
      expect(game.pegs.flatten.length).to eq(5)
    end

  end

  # let (:game2) { Towers.new, :game.add_pegs } 
  describe '#get_input' do
    it 'it should promt an input for user' do
      pos = double("0 1\n", :chomp => "0 1" )
      allow(game).to receive(:gets).and_return (pos)
      game.get_input
    end

    # it 'it should move a disk from one peg to another' do
    #   game.add_pegs
    #   pegs = game.instance_variable_get(:@pegs)
    #   # game.move_disk
    #   p pegs
    #   expect(game.move_disk(0, 1)).to eq(true)
    # end
  end
end

# board = [[5, 2], [1], [4, 3]]
# [[3], [2, 4, 5], [1]]