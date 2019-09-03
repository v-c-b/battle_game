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
    visit '/'
    fill_in 'Player1_Name', with: 'Rafaela'
    fill_in 'Player2_Name', with: 'Volker'
    click_button 'Submit'
    expect(page).to have_content 'Rafaela vs. Volker'
  end
end

describe 'player hitpoints', type: :feature do
  scenario 'display player 2 hitpoints' do
      visit '/'
      fill_in 'Player1_Name', with: 'Rafaela'
      fill_in 'Player2_Name', with: 'Volker'
      click_button 'Submit'
      expect(page).to have_content 'Rafaela 100 HP'
      expect(page).to have_content 'Volker 100 HP'

  end
end
