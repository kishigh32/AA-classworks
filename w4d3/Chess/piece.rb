class Piece

    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    # def to_s
    #     self.to_s
    # end

    def empty?
        false
    end

    def valid_moves
        moves.select {|pos| !move_into_check?(pos)}    
    end

    def pos=(val)
        @pos = val
    end

    private
    
    def move_into_check?(end_pos)
        board = board.dup
        board.move_piece!(pos, end_pos)
        board.in_check?(color)
    end
end