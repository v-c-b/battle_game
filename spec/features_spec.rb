#
#
# describe 'website content', type: :feature do
#  scenario 'Can run app and check page content' do
#    visit '/'
#    expect(page).to have_content 'Hello Battle!'
#  end
# end

describe 'game set up', type: :feature do
  scenario 'enter and store player 1 and 2 names' do
    sign_in_and_play
    expect(page).to have_content 'Dan vs. Volker'
  end
end

describe 'player hitpoints', type: :feature do
  scenario 'display player 2 hitpoints' do
      sign_in_and_play
      expect(page).to have_content "Dan #{$STARTHP} HP"
      expect(page).to have_content "Volker #{$STARTHP} HP"
  end
end

describe 'attack', type: :feature do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack Player 2')
    expect(page).to have_content "Dan attacked Volker"
  end

  scenario 'if player 1 attacks player 2, player 2 hit points reduces by 10' do
    sign_in_and_play
    expect{click_button('Attack Player 2')}.to change{$GAME.p2.hit_points}.by(-10)
  end
end


