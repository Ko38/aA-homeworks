require_relative "piece.rb"

class Knight < Piece
  include Stepable

  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "H"
  end

  def move_dirs
    [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
  end

end