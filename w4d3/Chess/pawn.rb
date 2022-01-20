require_relative 'piece'

class Pawn < Piece

    def symbol
        return "♟".colorize(color)
    end

    def moves
        forward_steps + side_attacks
    end

    private
    
    def at_start_row?
        return true if color == "white" && pos[0] == 1
        return true if color == "black" && pos[0] == 6
        false 
    end
    
    def forward_dir
        return 1 if color == "white"
        return -1 if color == "black"
    end

    def forward_steps
        row, col = pos

        step = [row + forward_dir, col]
        if !board.empty?(step)
            moves = []
        else
            moves = [step]
            two_step = [row + (forward_dir * 2), col]
            moves << two_step if at_start_row? && board.empty?(two_step)
            moves
        end
    end

    def side_attacks
        row, col = pos

        left = [row + forward_dir, col - 1] 
        right = [row + forward_dir, col + 1]

        moves = []
        moves << left if !board.empty?(left) && color != board[left].color
        moves << right if !board.empty?(right) && color != board[right].color

        moves
    end
end