module Stepable 

    def moves
        move = [] 
        move_diffs.each do |diff|
            new_pos = @pos[0] + diff[0], @pos[1] + diff[1]
            move << new_pos if @board.valid_move?(new_pos)
        end
        move
    end 

    private 

    def move_diffs
        #overwritten by subclass
    end 
end 