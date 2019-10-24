require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do
  scenario 'index page' do
    user = FactoryBot.create(:user)
    log_in(user)
    visit new_machine_path
    fill_in('machine[name]', :with => 'Lat Pulldown')
    find_button('Create Machine').click
    expect(page).to have_content('Lat Pulldown')
  end
end
