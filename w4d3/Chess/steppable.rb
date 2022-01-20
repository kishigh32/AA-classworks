module Steppable

    def moves
        moves = []
        cur_row, cur_col = pos
        move_diffs.each do |(dx, dy)|
            next_pos = [cur_row + dx, cur_col + dy]
            
            if board.empty?(next_pos)
                moves << next_pos
            elsif board[next_pos].color != self.color
                moves << next_pos
            end
        end
        return moves
    end

end