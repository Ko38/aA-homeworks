require_relative "piece.rb"

class Bishop < Piece
  include Slideable

  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "B"
  end

  def move_dirs
      ["diagonal"]
  end

  


end