require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

    def symbol
        return "♝".colorize(color)
    end

    private
    
    def move_dirs
        diagonal_dirs
    end

end