require 'rails_helper'

feature 'As a User I want to log in so that I can begin utilizing the additional features of the application' do
  background do
    create(:user, email: 'ilike@homepage.com', password: 'abcDEF123ivvvi')
  end

  scenario 'navigates first to the home page' do
    visit '/'
    within('#new_user') do
      fill_in 'Email', with: 'ilike@homepage.com'
      fill_in 'Password', with: 'abcDEF123ivvvi'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'additional features of the application'
  end
end
