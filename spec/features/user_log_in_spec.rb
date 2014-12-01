require 'rails_helper'

feature 'As a User I want to log in so that I can begin utilizing the additional features of the application' do
  EXPECTED_ADDL_FEATURES_CONTENT = 'additional features of the application'
  EXPECTED_SUCCESS_MESSAGE = 'Signed in successfully.'

  background do
    create(:user, email: 'iwanna@login.com', password: 'abcDEF123ivvvi')
  end

  scenario 'initial hit to home page goes to log in page' do
    visit '/'
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'successful log in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'iwanna@login.com'
    fill_in 'Password', with: 'abcDEF123ivvvi'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'failure due to bad password' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'iwanna@login.com'
    fill_in 'Password', with: 'abcDEF123456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password.'
    expect(page).to have_button 'Log in'
  end

  scenario 'failure due to unrecognized email' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'whoami@login.com'
    fill_in 'Password', with: 'abcDEF123ivvvi'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password.'
    expect(page).to have_button 'Log in'
  end

end
