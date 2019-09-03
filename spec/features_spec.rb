

describe 'website content', type: :feature do
  scenario 'Can run app and check page content' do
    visit '/'
    expect(page).to have_content 'Hello Battle!'
  end
end
