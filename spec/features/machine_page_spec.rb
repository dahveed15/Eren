require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do
  scenario 'index page' do
    visit new_machines_path
    fill_in('Name: ', :with => 'Lat Pulldown')
    find_button('Create Machine').click
    
  end
end
