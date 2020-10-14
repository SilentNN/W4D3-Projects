require_relative 'slideable'
require_relative '../piece'

class Queen < Piece
    include Slideable

    def symbol
        "♛".colorize(color)
    end

    def move_directions
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end