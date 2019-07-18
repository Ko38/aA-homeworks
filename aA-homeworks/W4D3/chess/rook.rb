require_relative "piece.rb"

class Rook < Piece
 include Slideable

  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "R"
  end

  def move_dirs
      ["straight"]
  end


end