
require_relative '../piece'
class Pawn < Piece
    
    def symbol
        "♟︎".colorize(color)
    end

    def move_directions
        result = []
        result += forward_steps
        result += side_attacks
        result
    end

    private
    def at_start_row?
        # (@color == "white" && @pos[0] == 6) || (@color == "black" && @pos[0] == 1)
        if @color == "white"
            @pos[0] == 6
        else
            @pos[0] == 1
        end
    end

    def forward_dir
        if @color == "white" 
            return -1 
        else 
            return 1 
        end
    end

    def forward_steps
        x, y = @pos
        moves = []
        moves << [x + forward_dir, y] if @board[[x + forward_dir, y]].nil?
        moves << [x + forward_dir * 2, y] if @board[[x + forward_dir, y]].nil? && at_start_row? && @board[[x + forward_dir * 2, y]]
    end

    def side_attacks
        moves = []
        x, y = @pos 
        # if @board[x + forward_dir, y + 1].color != @color 
        if @color == "white"
            if @board[x + forward_dir, y + 1].color == "black"
                moves << [x + forward_dir, y + 1]
            end 
            if @board[x + forward_dir, y - 1].color == "black"
                moves << [x + forward_dir, y - 1]
            end
        else 
            if @board[x + forward_dir, y + 1].color == "white"
                moves << [x + forward_dir, y + 1]
            end
            if @board[x + forward_dir, y - 1].color == "white"
                moves << [x + forward_dir, y - 1]
            end

        end
        moves 

    end
end