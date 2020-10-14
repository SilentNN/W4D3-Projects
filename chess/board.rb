require_relative "piece"
require_relative "./pieces/rook"
class Board
    attr_reader :grid
    def initialize
        
        @grid = Board.fill_board
        
    end

    def self.fill_board 
        grid = Array.new(8) {Array.new(8, NullPiece.instance)}
        grid[0] = Board.fill_backrow("black")
        grid[1] = Board.fill_pawns("black")
        grid[6] = Board.fill_pawns("white")
        grid[7] = Board.fill_backrow("white")
        grid
    end

    def self.fill_backrow(color)
        if color == "white" 
            row = 7 
        else 
            row = 0 
        end
        [
            Rook.new(color, self, [row, 0]),
            Knight.new(color, self, [row, 1]),
            Bishop.new(color, self, [row, 2]),
            King.new(color, self, [row, 3]), 
            Queen.new(color, self, [row, 4]), 
            Bishop.new(color, self, [row, 5]), 
            Knight.new(color, self, [row, 6]), 
            Rook.new(color, self, [row, 7])
        ]
    end

    def self.fill_pawns(color)
        if color == "white"
            row = 6 
        else 
            row = 1
        end

        pawns = []
        (0..7).each do |i|
            pawns << Pawn.new(color, self, [row, i])
        end
        pawns
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid_move?(pos)
        pos.all? {|num| num.between?(0,7)}
    end

    def move_piece(start_pos, end_pos)
        if !self[start_pos].is_a?(Piece)
            raise "no piece there"
        elsif !valid_move?(end_pos) # TODO: fix conditional
            raise "not a valid destination"
        end
        
        self[end_pos] = self[start_pos]
        self[start_pos] = nil 
    end
    
    def add_piece(piece, pos)

    end
    
    def checkmate?(color)

    end
    
    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end
end

# @grid  = [
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece]
# ]