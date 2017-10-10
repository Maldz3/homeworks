class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
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
    if start_pos > 13 || start_pos < 0
      raise "Invalid starting cup"
    end
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    number_of_stones = @cups[start_pos].length
    @cups[start_pos] = []
    p @cups[start_pos]
    n = start_pos + 1
    until number_of_stones == 0
      n = n % @cups.size
      if n == 6
        if current_player_name == @name1
          @cups[6] << :stone
          number_of_stones -= 1
        end
      elsif n == 13
        if current_player_name == @name2
          @cups[13] << :stone
          number_of_stones -= 1
        end
      else
        @cups[n] << :stone
        number_of_stones -= 1
      end
      n += 1
    end

    render
    next_turn(n-1)

  end

  def next_turn(ending_cup_idx)

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
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
