require_relative 'pieces'

class Board
   
    attr_reader :rows
    
    def initialize
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        (0..7).each do |i|
            @rows[1][i] = Pawn.new("white", self, [1, i])
            @rows[6][i] = Pawn.new("black", self, [6, i])
            @rows[0][i] = pieces[i].new("white", self, [0, i])
            @rows[7][i] = pieces[i].new("black", self, [7, i])
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
    
    def move_piece(color, start_pos, end_pos)
        raise "cannot move other player's piece" if color != self[start_pos].color
        raise "cannot move into check" if !piece.valid_moves.include?(end_pos)
        raise "no piece here!" if !valid_pos(start_pos) || self[start_pos].empty?
        raise "out of bounds!" if !valid_pos(end_pos)
        self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
        rows
      end
  
    def valid_pos?(pos)
        row, col = pos
        return false if row > 7 || row < 0 || col > 7 || col < 0
        true
    end
   
    def find_king(color)
        self.each_with_index do |row, x|
            row.each_with_index do |piece, y|
                return [x, y] if piece.is_a?(King) && piece.color == color
            end
        end
    end
   
    def add_piece(piece, pos)
        self[pos] = piece
    end
   
    def dup
        temp_array = Marshal.load(Marshal.dump(self))
        temp_array
    end
   
    def move_piece!(color, start_pos, end_pos)
        self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    end
    
    def in_check?(color)
        pos = find_king(color)
        pieces.any? {|piece| piece.color != color && piece.moves.include?(pos)}          
    end
   
    def pieces
        @rows.flatten.select {|piece| !piece.empty?}
    end

    def all_pieces
        @rows.flatten
    end
    
    def checkmate?(color)
        our_pieces = pieces.select{|piece| piece.color == color}
        our_pieces.all? {|piece| piece.valid_moves.length == 0}
    end
end