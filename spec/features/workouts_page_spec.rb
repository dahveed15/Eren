require 'rails_helper'

RSpec.describe 'Workout', type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  let!(:cardio_workout) { FactoryBot.create(:workout, name: 'Running', user: user) }
  scenario 'create workout' do
    log_in(user)
    visit new_workout_path
    fill_in('workout[name]', :with => 'Cardio')
    find_button('Create Workout').click
    expect(page).to have_content('Workouts')
  end

  scenario 'add activity to workout' do
    log_in(user)
    visit workouts_path
    find_link('Running').click
    expect(page).to have_content('Add Activity to your Workout')
  end


end
