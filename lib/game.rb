# manages turns and moves
class Game
  attr_reader :p1, :p2, :current_turn, :receiver

  def self.the_game
    @game
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def initialize(player1, player2)
    @p1 = Player.new(player1)
    @p2 = Player.new(player2)
    @current_turn = @p1
    @receiver = @p2
  end

  def attack(player)
    player.receive_damage(Random.rand(1..100))
  end

  def switch_turn
    if @current_turn == @p1
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
