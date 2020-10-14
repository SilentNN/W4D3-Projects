require_relative 'cursor'
require 'colorize'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.grid.each_with_index do |row, idx1|
            formatted = row.map.with_index do |piece, idx2|
                if [idx1, idx2] == @cursor.cursor_pos
                    piece.symbol.colorize(:color => piece.color == "black" ? :red : :white, :background => :green)
                else
                    piece.symbol.colorize(:color => piece.color == "black" ? :red : :white, :background => :light_black)
                end
            end
            puts formatted.join(" ")
        end
        nil
    end

    def ui
        until self.render
            p @cursor.cursor_pos
            @cursor.get_input
            system("clear")
        end
    end
end