class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
    @cups
  end

  def valid_move?(start_pos)
    if start_pos > 14 || start_pos < 1
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    number_of_stones = @cups[start_pos].length
    @cups[start_pos] = []
    n = start_pos + 1
    until number_of_stones == 0
      if  (n == 6 && current_player_name == @name2) || (n == 13 && current_player_name == @name1)
        n == 13 ? n = 1 : n += 1
      else
        @cups[n] << :stone
        n == 13 ? n = 1 : n += 1
        number_of_stones -= 1
      end
    end

    render
    next_turn(n)
    # return :prompt if current_player_name == @name1 && (n > 0 || n < 7)
    # return :prompt if current_player_name == @name2 && (n >= 7 || n <= 13)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    p '***************'
    p ending_cup_idx
    p @cups[ending_cup_idx].length
    p '***************'
    if @cups[ending_cup_idx].length >= 1
      #next_turn(n)
      return ending_cup_idx - 1
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |el| @cups[el].empty? } || (7..12).all? { |el| @cups[el].empty? }
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length < @cups[13].length
      return @name2
    else
      return :draw
    end
  end
end
