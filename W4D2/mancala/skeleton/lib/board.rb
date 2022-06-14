require_relative 'player.rb'

class Board
  
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @current_player = @player1 
    @cups = Array.new(14) {Array.new(0)}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        (1..4).each { |i| cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    while stones.length > 0 
      start_pos = (start_pos + 1) % @cups.length 
      if start_pos == 6  
        @cups[start_pos] << stones.pop if current_player_name == @player1.name
      elsif start_pos == 13 
        @cups[start_pos] << stones.pop if current_player_name == @player2.name 
      else
        @cups[start_pos] << stones.pop 
      end
    end
    self.render 
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      return :prompt 
    elsif @cups[ending_cup_idx].length == 1
      return :switch 
    else 
      return ending_cup_idx
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
    (0..5).all? {|i| @cups[i].length == 0} || (7..12).all? {|i| @cups[i].length == 0}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length 
    return @player1.name if @cups[6].length > @cups[13].length 
    @player2.name 
  end
end
