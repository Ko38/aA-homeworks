require_relative "rook"
require_relative "queen"
require_relative "bishop"
require_relative "knight"
require_relative "pawn"
require_relative "king"
require_relative "null_piece"



class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    setup_board
  end

  def setup_board
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if row_idx == 7 || row_idx == 0
          color = row_idx == 0 ? "black" : "white"
          if col_idx == 0 || col_idx == 7
            @board[row_idx][col_idx] = Rook.new(self, [row_idx, col_idx], color)
          elsif col_idx == 1 || col_idx == 6
            @board[row_idx][col_idx] = Knight.new(self, [row_idx, col_idx], color)
          elsif col_idx == 2 || col_idx == 5
            @board[row_idx][col_idx] = Bishop.new(self, [row_idx, col_idx], color)
          elsif col_idx == 3
            @board[row_idx][col_idx] = Queen.new(self, [row_idx, col_idx], color)
          elsif col_idx == 4
            @board[row_idx][col_idx] = King.new(self, [row_idx, col_idx], color)
          end
        elsif row_idx == 6 || row_idx == 1
            color = row_idx == 1 ? "black" : "white"
            @board[row_idx][col_idx] = Pawn.new(self, [row_idx, col_idx], color)
        else
          @board[row_idx][col_idx] = NullPiece.instance
        end
      end
    end
  end



  def valid_move?(start_pos, end_pos)
    # pos[0] > 0 && pos[0] < 8 && pos[1] > 0 && pos[1] < 8
    start_row, start_col = start_pos 
    end_row, end_col = end_pos

    if @board[start_row][start_col].is_a?(NullPiece) 
      return false
    elsif end_row < 0 || end_row > 7 || end_col < 0 || end_col > 7
      return false
    elsif !@board[end_row][end_col].is_a?(NullPiece) && @board[end_row][end_col].color == @board[start_row][start_col].color
      return false
    end
    true
  end

  def move_piece(start_pos, end_pos)
    if !valid_move?(start_pos, end_pos)
      raise "It is not a valid move"
    end
    @board[end_pos[0]][end_pos[1]] = @board[start_pos[0]][start_pos[1]]
    @board[start_pos[0]][start_pos[1]] = NullPiece.instance
    @board[end_pos[0]][end_pos[1]].track_pos(end_pos)
  end

  def all_pieces(color)
    all_pieces = []
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        all_pieces << el if el.color == color 
      end
    end
    return all_pieces
  end

  def king_pos(color)
    all_pieces(color).each do |piece|
      return piece.current_pos if piece.is_a?(King)
    end

  end


  def in_check?(color)
    king_pos = king_pos(color)
    opposite_color = color == "white" ? "black"  : "white"
    all_pieces = all_pieces(opposite_color)
    all_pieces.each do |piece|
      return true if piece.moves.include?(king_pos)
    end
    false
  end

  def checkmate?(color)
    
  end
end

