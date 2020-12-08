require 'rails_helper'

RSpec.describe 'Activity', type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  # let!(:benchpress_activity) { Activity.create(name: 'benchpress', user: user) }
  # let!(:benchpress_exercise) { benchpress_activity.exercises.create(reps: 12, sets: 5, weight_value: 100, units: 'kg')}
  scenario 'create activity' do
    log_in(user)
    visit new_workout_path
    fill_in('workout[name]', :with => 'Cardio')
    find_button('Create Workout').click
    expect(page).to have_content('Workouts')
  end



end
