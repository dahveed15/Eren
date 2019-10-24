require 'rails_helper'

RSpec.describe 'Splash page', type: :feature, js: true do
  before do
    user = FactoryBot.create(:user)
    log_in(user)
  end
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Welcome to Eren, the best app ever!')
    find_link('Add Machine').click
    expect(page).to have_content('Add a Machine')
  end

  context 'with a machine created' do
    let!(:benchpress_machine) { Machine.create(name: 'benchpress') }

    scenario 'add an exercise' do
      visit root_path
      expect(page).to have_content(benchpress_machine.name)
      find_link('Add Exercise').click
      expect(page).to have_content('Add an Exercise for benchpress')
    end
  end
end
