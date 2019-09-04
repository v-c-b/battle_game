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
    expect(page).to have_content 'Dan 100 HP'
    expect(page).to have_content 'Volker 100 HP'
  end
end

describe 'attack', type: :feature do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Dan attacked Volker'
  end

  scenario 'if player 1 attacks player 2, player 2 hit points reduces by 10' do
    sign_in_and_play
    expect { click_button('Attack') }.to change { Game.the_game.p2.hit_points }.by(-10)
  end
end

describe 'switching turns', type: :feature do
  scenario '2 attacks' do
    sign_in_and_play
    expect { click_button('Attack') }.to change { Game.the_game.p2.hit_points }.by(-10)
    expect(page).to have_content 'Dan attacked Volker'
    click_button('Next turn')
    expect { click_button('Attack') }.to change { Game.the_game.p1.hit_points }.by(-10)
    expect(page).to have_content 'Volker attacked Dan'
  end
end

describe 'losing condition', type: :feature do
  scenario 'player has 0 hit points and loses the game' do
    sign_in_and_play
    18.times do
      click_button('Attack')
      click_button('Next turn')
    end
    click_button('Attack')
    expect(page).to have_content 'Volker died'
  end
end
