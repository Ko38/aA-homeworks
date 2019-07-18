require_relative "piece.rb"

class King < Piece
  include Stepable

  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "K"
  end

  def move_dirs
    [[0,1],[0,-1],[1,0],[-1,0],[1,1],[-1,-1],[1,-1],[-1,1]]
  end

end