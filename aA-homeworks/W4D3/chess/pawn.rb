require_relative "piece.rb"

class Pawn < Piece


  def initialize(board, start_pos, color)
    super(board, start_pos, color)
    @symbol = "P"
  end

  def moves
    possible_moves =[]
    if @color == "black"
      if @current_pos[0] == 1
        (1..2).each do |i|
          new_pos = [@current_pos[0] + i,current_pos[1] ]
          if valid_move?(new_pos)
            possible_moves << new_pos
          else  
            break
          end
        end
      else
        new_pos = [@current_pos[0] + 1,current_pos[1] ]
        if valid_move?(new_pos)
          possible_moves << new_pos
        end
      end
      diag1 = [@current_pos[0] + 1, current_pos[1] - 1]
      diag2 = [@current_pos[0] + 1, current_pos[1] + 1]
      if !@board.board[diag1[0]][diag1[1]].nil? && @board.board[diag1[0]][diag1[1]].color == "white"
        possible_moves << diag1
      end
      if !@board.board[diag2[0]][diag2[1]].nil? && @board.board[diag2[0]][diag2[1]].color == "white"
        possible_moves << diag2
      end

    else #white
      if @current_pos[0] == 1
        (1..2).each do |i|
          new_pos = [@current_pos[0] - i,current_pos[1] ]
          if valid_move?(new_pos)
            possible_moves << new_pos
          else
            break
          end
        end
      else
        new_pos = [@current_pos[0] - 1,current_pos[1] ]
        if valid_move?(new_pos)
          possible_moves << new_pos
        end
      end
      diag1 = [@current_pos[0] - 1, current_pos[1] - 1]
      diag2 = [@current_pos[0] - 1, current_pos[1] + 1]
      if !@board.board[diag1[0]][diag1[1]].nil? && @board.board[diag1[0]][diag1[1]].color == "black" 
        possible_moves << diag1
      end
      if !@board.board[diag2[0]][diag2[1]].nil? && @board.board[diag2[0]][diag2[1]].color == "black"
        possible_moves << diag2
      end
    end
    possible_moves
  end

  def valid_move?(end_pos)
    end_row, end_col = end_pos
    if end_row < 0 || end_row > 7 || end_col < 0 || end_col > 7
      return false
    elsif !@board.board[end_row][end_col].is_a?(NullPiece)
      return false
    end
    true
  end

end