require_relative 'slideable'
require_relative '../piece'

class Bishop < Piece
    include Slideable

    def symbol
        "♝".colorize(color)
    end

    def move_directions
        DIAGONAL_DIRS
    end
end