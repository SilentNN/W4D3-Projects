module Slideable 
    HORIZONTAL_DIRS = [
        [1, 0],
        [-1, 0],
        [0, 1], 
        [0, -1]
    ]

    DIAGONAL_DIRS = [
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1]
    ]

    # def horizontal_dirs
    #     moves = []
    #     HORIZONTAL_DIRS.each do |dir|
    #         moves << grow_unblocked_moves_in_dir(*dir)
    #     end
    #     moves 
    # end

    # def diagonal_dirs
    #     moves = []
    #     DIAGONAL_DIRS.each do |dir|
    #         moves << grow_unblocked_moves_in_dir(*dir)
    #     end
    #     moves 
    # end 

    def moves 
        move =  []
        move_directions do |dir|
            move += grow_unblocked_moves_in_dir(*dir)
        end
        move
    end 
    
    private

    def move_dirs 
        #overwritten by subclass

    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []

        x, y = @pos
        
        until !(x + dx).between?(0, 7) || !(y + dy).between?(0, 7)
            x += dx
            y += dy
            if @board[[x,y]] != nil #x, y new pos 
                if @color == @board[[x,y]].color # if the piece color and color of the piece we just found 
                    return moves 
                else
                    moves << [x,y] #eat that piece 
                    return moves #exit the method
                end
            end
            moves << [x, y] 
        end
        moves
    end

end

 #@pos 3,3
# 4,3
# 5,3
# 6,3
# 7,3