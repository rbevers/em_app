require 'rails_helper'

feature 'login script for access from external site', js: true do
  scenario 'included as a script' do
    visit '/assets/em/login.js'
  end
end
