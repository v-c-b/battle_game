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
