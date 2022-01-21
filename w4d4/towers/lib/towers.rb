class Towers

  attr_reader :pegs

  POSSIBLE_DISCS = [1, 2, 3, 4, 5]

  def initialize
    @pegs = Array.new(3){ Array.new }
    self.add_pegs
  end

  def add_pegs
    POSSIBLE_DISCS.each{ |disc| self.pegs[rand(3)] << disc }
  end

  def get_input
    input = gets.chomp.split(" ").to_a
    input
  end

  def move_disk(peg1, peg2)
    # x, y = self.get_input
    if pegs[peg1][-1] < pegs[peg2][-1]  
      first = pegs[peg1].pop
      pegs[peg2].push(first)
    end 
  end

  def render

  end

  def win?

  end

  def play

  end
end



t = Towers.new
t.add_pegs
p t
#[
#   [5,3],
#   [4,1],
#   [2]
# ]