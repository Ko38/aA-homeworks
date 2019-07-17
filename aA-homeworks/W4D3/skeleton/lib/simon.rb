class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    p show_sequence
    user_input = require_sequence
    
    if user_input == @seq.first
      round_success_message
    else
      @game_over = true
    end
    if !@game_over
      @sequence_length += 1
    end
    
  end

  def show_sequence
    add_random_color
    @seq
  end

  def require_sequence
    p "User input:"
    gets.chomp
  end

  def add_random_color
    rand_idx = rand(0..3)
    @seq << COLORS[rand_idx]
  end

  def round_success_message
    p "congrats"
  end

  def game_over_message
    p "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    
  end
end
