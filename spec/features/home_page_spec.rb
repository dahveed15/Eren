require 'rails_helper'

RSpec.describe 'Splash page', type: :feature, js: true do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Welcome to Eren, the best app ever!')
  end
end
