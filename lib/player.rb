class Player

  $STARTHP = 100
  attr_reader :name, :hit_points

  def initialize(player_name, hit_points = $STARTHP)
    @name = player_name
    @hit_points = hit_points
  end
  def receive_damage(damage = 10)
    @hit_points -= damage
  end

end
