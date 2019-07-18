module Slideable
  HORIZONTAL_DIRS: [[0,1],[-1,0],[],[]]
  DIAGONAL_DIRS: []

  
  #needs to know what directions piece can move
  def moves(*move_dirs)
    possible_moves = []

  end

  def valid_move?(pos)
    pos[0] > 0 && pos[0] < 8 && pos[1] > 0 && pos[1] < 8
  end


end

module Stepable


end



class Piece

  attr_reader :symbol, :color


  def initialize(board, start_pos, color)
    if color == "white"
      @symbol = :O
    else
      @symbol = :X
    end
    @board = board
    @current_pos = start_pos
    @color = color
  end

  def track_pos(new_pos)
    @current_pos = new_pos
  end

  def possible_moves


  end



end
