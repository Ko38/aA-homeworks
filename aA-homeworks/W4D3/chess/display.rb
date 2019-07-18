require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_accessor :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    background_color = [:light_red, :blue] 
    @board.board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        background = background_color[0]
        if @cursor.cursor_pos == [row_idx, col_idx]
          background = :magenta
        end
        if el.color == "white"
          print " #{el.symbol} ".colorize(:color => :white, :background => background)
        elsif el.color == "black"
          print " #{el.symbol} ".colorize(:color => :black, :background => background)
        else 
          print " #{el.symbol} ".colorize(:background => background)
        end
        background_color.push(background_color.shift)
      end
      background_color.push(background_color.shift)
      print "\n"
    end
  end




end


b = Board.new
d = Display.new(b)
d.render
p "---------"

b.move_piece([7,0],[2,0])
b.move_piece([7,2],[2,2])
b.move_piece([7,1],[2,1])
b.move_piece([1,3],[4,1])
d.render
p b.in_check?("black")
p b.in_check?("white")

# while true
#   d.cursor.get_input
#   system("clear")
  
  
#   d.render
# end

# puts "This is blue".colorize(:blue)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "  ".colorize(:color => :light_blue, :background => :red)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red.blink
# #p String.color_samples