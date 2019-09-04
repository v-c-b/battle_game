class Game

  attr_reader :p1, :p2, :current_turn, :receiver

  def initialize(p1, p2)
    @p1 = Player.new(p1)
    @p2 = Player.new(p2)
    @current_turn = @p1
    @receiver = @p2
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    if @current_turn == @p1 then
      @current_turn = @p2
      @receiver = @p1
    else
      @current_turn = @p1
      @receiver = @p2
    end
  end

  def game_over?
    @p1.hit_points <= 0 || @p2.hit_points <= 0
  end

  def loser
    @p1.hit_points <= 0 ? @p1 : @p2
  end

end
