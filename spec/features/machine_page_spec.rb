require 'rails_helper'

RSpec.describe 'Machine', type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  let!(:benchpress_machine) { Machine.create(name: 'benchpress', user: user) }
  let!(:benchpress_exercise) { benchpress_machine.exercises.create(reps: 12, sets: 5, weight_value: 100, units: 'kg')}
  scenario 'create machine' do
    log_in(user)
    visit new_machine_path
    fill_in('machine[name]', :with => 'Lat Pulldown')
    find_button('Create Machine').click
    expect(page).to have_content('Lat Pulldown')
  end

  scenario 'create machine error handling' do
    log_in(user)
    visit new_machine_path
    find_button('Create Machine').click
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'machine show' do
    log_in(user)
    visit machine_path(benchpress_machine)
    expect(page).not_to have_content('No exercises found for benchpress.')
  end
end
