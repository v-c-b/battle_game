
describe 'Game' do
  let (:player) { double :player }

  scenario 'can attack' do
    expect(Game.new(player, player)).to respond_to (:attack)
  end
  scenario 'player receives damage when attacked' do
    expect(player).to receive(:receive_damage)
    Game.new(player, player).attack(player)
  end
end
