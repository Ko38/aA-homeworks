require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def flip_mark(mark)
    mark == :o ? :x : :o
  end

  def mark_choser
    if self.next_mover_mark == :x
      self.next_mover_mark = :o
    elsif self.next_mover_mark == :o
    self.next_mover_mark = :x
    end
    self.next_mover_mark
  end

  def losing_node?(evaluator)
    self.children.each do |child|
       if child.board.winner == evaluator
        return false
       end
    end
    return true
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
    result = []
    possible.each do |pos|
      if self.board.empty?(pos)
          result << TicTacToeNode.new(self.board.dup, flip_mark(self.next_mover_mark), pos)
      end
    end
    result
  end
end
