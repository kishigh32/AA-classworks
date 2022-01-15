class KnightPathFinder

  def self.valid_moves(pos)

  end

    def initialize(arr)
        @root_node = PolyTreeNode.new(arr)
        @considered_positions = [arr]
    end

    def build_move_tree
        
    end

    def new_move_positions(pos)
      arr = KnightPathFinder.valid_moves(pos)
      new_arr = []
      arr.each do |move|
        new_arr << move if !@considered_positions.include?(move)
      end
      @considered_positions += new_arr
      return new_arr
    end
    
end