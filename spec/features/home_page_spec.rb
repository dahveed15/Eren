require 'rails_helper'

RSpec.describe 'Splash page', type: :feature, js: true do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Welcome to Eren, the best app ever!')
    find_button('Add Machine').click
    expect(page).to have_content('Add a Machine')
  end
end
