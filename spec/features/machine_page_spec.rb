require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do
  let!(:user) { FactoryBot.create(:user) }
  scenario 'index page' do
    log_in(user)
    visit new_machine_path
    fill_in('machine[name]', :with => 'Lat Pulldown')
    find_button('Create Machine').click
    expect(page).to have_content('Lat Pulldown')
  end

  scenario 'error handling' do
    log_in(user)
    visit new_machine_path
    find_button('Create Machine').click
    expect(page).to have_content("Name can't be blank")
  end
end
