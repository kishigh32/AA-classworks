module Slideable
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[1,1][1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move
        moves = []
        move_dirs.each do |dx, dy|
            moves += grow_unblocked_moves_in_dir(dx,dy)
        end
        moves
    end

    private

    def grow_unblocked_moves_in_dir(dx, dy)

        moves = []
        row, col = pos
        next_pos = [row + dx, col + dy]
        while board.valid_pos?(next_pos)       
            if board.empty?(next_pos)
                moves << next_pos
            elsif board[next_pos].color == color
                break
            else
                moves << next_pos if board[next_pos].color != color
                break
            end
            next_pos = [next_pos[0] + dx, next_pos[1] + dy]
        end
        moves
    end


end