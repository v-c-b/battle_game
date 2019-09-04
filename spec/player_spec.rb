describe 'Player' do
  scenario 'it returns the name' do
    expect(Player.new('Dan').name).to eq('Dan')
  end
end
