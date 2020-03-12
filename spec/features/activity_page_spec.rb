require 'rails_helper'

RSpec.describe 'Activity', type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  let!(:benchpress_activity) { Activity.create(name: 'benchpress', user: user) }
  let!(:benchpress_exercise) { benchpress_activity.exercises.create(reps: 12, sets: 5, weight_value: 100, units: 'kg')}
  scenario 'create activity' do
    log_in(user)
    visit new_activity_path
    fill_in('activity[name]', :with => 'Lat Pulldown')
    find_button('Create Activity').click
    expect(page).to have_content('Lat Pulldown')
  end

  scenario 'create activity error handling' do
    log_in(user)
    visit new_activity_path
    find_button('Create Activity').click
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'activity show' do
    log_in(user)
    visit activity_path(benchpress_activity)
    expect(page).not_to have_content('No exercises found for benchpress.')
  end
end
