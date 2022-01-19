require_relative 'piece'

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        (0..7).each do |i|
            @rows[0][i] = Piece.new()
            @rows[1][i] = Piece.new()
            @rows[6][i] = Piece.new()
            @rows[7][i] = Piece.new()
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        raise "Position is empty!" if self[start_pos] == nil
        piece = self[start_pos]
        #raise "This piece cannot move like that" if !piece.valid_moves.include?(end_pos)
        raise "Piece cannot go there" if self[end_pos] != nil
        self[end_pos] = piece
        self[start_pos] = nil
    end

end