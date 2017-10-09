class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system 'clear'
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
    round_success_message unless @game_over
  end

  def show_sequence
    add_random_color
    p @seq.dup
    sleep(2)
    system 'clear'
  end

  def require_sequence
    puts "Now repeat the sequence"
    input = gets.chomp.split
    @game_over = true if input != @seq
  end

  def add_random_color
    @seq << COLORS.sample
    @sequence_length += 1 if @seq.length > 1
  end

  def round_success_message
    puts "Great job, keep going!"
  end

  def game_over_message
    puts "Sorry game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

#Simon.new.play
