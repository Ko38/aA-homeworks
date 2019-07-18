module Slideable
  STRAIGHT_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

  
  def moves
    possible_moves = []
    if move_dirs.include?("diagonal")
      possible_moves += get_possible_moves(DIAGONAL_DIRS)
    end
    if move_dirs.include?("straight") 
      possible_moves += get_possible_moves(STRAIGHT_DIRS)
    end
    possible_moves
  end

  def get_possible_moves(directions)
    row, col = @current_pos
    possible_moves = []
    directions.each do |dir|
        end_pos = [row + dir[0], col + dir[1]] 
        while @board.valid_move?(@current_pos, end_pos)
          possible_moves << end_pos
          break if @board.board[end_pos[0]][end_pos[1]].color != self.color && !@board.board[end_pos[0]][end_pos[1]].is_a?(NullPiece)
          end_pos = [end_pos[0] + dir[0], end_pos[1] + dir[1]] 
        end
    end
    possible_moves
  end
  
end

module Stepable
  
def moves
  possible_moves = []
  move_dirs.each do |dir|
    end_pos = [@current_pos[0] + dir[0], @current_pos[1] + dir[1]]
    if @board.valid_move?(@current_pos, end_pos)
      possible_moves << end_pos
    end
  end
  possible_moves
end



end



class Piece

  attr_reader :symbol, :color, :current_pos


  def initialize(board, start_pos, color)
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
