def sign_in_and_play
  visit '/'
  fill_in 'Player1_Name', with: 'Dan'
  fill_in 'Player2_Name', with: 'Volker'
  click_button 'Submit'
end
