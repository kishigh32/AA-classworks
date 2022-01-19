class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        self.to_s
    end

    def empty?
        return true if self.nil?
        false
    end

    # def valid_moves    
    # end

    def pos=(val)
        @pos = val
    end

    

end