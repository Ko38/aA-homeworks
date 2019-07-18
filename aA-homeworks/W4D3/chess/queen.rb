require_relative "piece.rb"

class Queen < Piece
  include Slideable

  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "Q"
  end


  def move_dirs
      ["straight", "diagonal"]
  end



end