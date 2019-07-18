require_relative "piece"
require_relative "null_piece"

class Board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    setup_board
  end

  def setup_board
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if [0,1].include?(row_idx)
          @board[row_idx][col_idx] = Piece.new(@board, [row_idx, col_idx], "white")
        elsif [6,7].include?(row_idx)
          @board[row_idx][col_idx] = Piece.new(@board, [row_idx, col_idx], "black")
        else
          @board[row_idx][col_idx] = NullPiece.instance
        end
      end
    end
  end

  def print_board
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
          print "#{el.symbol} "
      end
      print "\n"
    end
  end

  def valid_move?(pos)
    pos[0] > 0 && pos[0] < 8 && pos[1] > 0 && pos[1] < 8
  end

  def move_piece(start_pos, end_pos)
    if @board[start_pos[0]][start_pos[1]].is_a?(NullPiece)
      raise "There is no piece at that position."
    elsif !valid_move?(end_pos)
      raise "It's out of bounds!"
    elsif !@board[end_pos[0]][end_pos[1]].is_a?(NullPiece) && @board[end_pos[0]][end_pos[1]].color == @board[start_pos[0]][start_pos[1]].color
      raise "That's one of your guys!"
    end
    @board[end_pos[0]][end_pos[1]] = @board[start_pos[0]][start_pos[1]]
    @board[start_pos[0]][start_pos[1]] = NullPiece.instance
    @board[end_pos[0]][end_pos[1]].track_pos(end_pos)
  end

end

b = Board.new
b.print_board
b.move_piece([0,0],[7,7])
#b.move_piece([0,0],[2,2])

p "------------"
b.print_board
