require 'rails_helper'

RSpec.describe 'Add Activity page', type: :feature, js: true do

  context 'with a previous activity already created' do
    let(:user) { FactoryBot.create(:user) }
    let(:activity_name) { 'benchpress' }
    let!(:activity) { Activity.create(name: activity_name, user: user) }

    scenario 'index page' do
      log_in(user)
      visit new_activity_exercise_path(activity)
      fill_in('exercise[reps]', :with => '10')
      fill_in('exercise[sets]', :with => '3')
      fill_in('exercise[weight_value]', :with => '120')
      select('kg', :from => 'exercise[units]')
      find_button('Create Exercise').click
      expect(activity.exercises.count).to eq(1)
      expect(page).to have_content('3 sets of 10 reps at 120 kg')

    end

    scenario 'back button' do
      log_in(user)
      visit new_activity_exercise_path(activity)
      click_on(class: 'qa-back-button')
      expect(page).to have_content('Welcome to Eren')
    end

    context 'with an exercise already created' do
      let!(:previous_exercise) { activity.exercises.create(reps: 12, sets: 5, weight_value: 100, units: 'kg')}
      scenario 'it prefills the input fields with the previous exercise data' do
        log_in(user)
        visit new_activity_exercise_path(activity)
        expect(find_field('exercise[reps]').value).to eq('12')
        expect(find_field('exercise[sets]').value).to eq('5')
        expect(find_field('exercise[weight_value]').value).to eq('100')
        expect(find_field('exercise[units]').value).to eq('kg')
      end
    end

    scenario 'error handling' do
      log_in(user)
      visit new_activity_exercise_path(activity)
      fill_in('exercise[sets]', :with => '')
      find_button('Create Exercise').click
      expect(page).to have_content("Reps can't be blank")
      expect(page).to have_content("Sets can't be blank")
      expect(page).to have_content("Weight value must be present")
    end

    context 'with a calisthenics activity' do
      let(:activity_name) { 'pushups' }

      scenario 'can create a calisthenics exercise' do
        log_in(user)
        visit new_activity_exercise_path(activity)
        fill_in('exercise[reps]', :with => '10')
        fill_in('exercise[sets]', :with => '3')
        check('Bodyweight')
        find_button('Create Exercise').click
        expect(page).to have_content('3 sets of 10 reps')
        expect(page).to_not have_content(/lbs|at|::/)
      end

      context 'with a time-based activity' do
        let(:activity_name) { 'jumprope' }

        scenario 'can create a calisthenics exercise' do
          log_in(user)
          visit new_activity_exercise_path(activity)
          fill_in('exercise[reps]', :with => '25')
          fill_in('exercise[sets]', :with => '4')
          check('Bodyweight')
          fill_in('exercise[hours]', :with => '1')
          fill_in('exercise[minutes]', :with => '5')
          fill_in('exercise[seconds]', :with => '10')
          find_button('Create Exercise').click
          expect(page).to have_content('4 sets of 25 reps for 01:05:10')
        end

        scenario 'can create a calisthenics exercise if a time field is left blank' do
          log_in(user)
          visit new_activity_exercise_path(activity)
          fill_in('exercise[reps]', :with => '25')
          fill_in('exercise[sets]', :with => '4')
          check('Bodyweight')
          fill_in('exercise[minutes]', :with => '5')
          fill_in('exercise[seconds]', :with => '10')
          find_button('Create Exercise').click
          expect(page).to have_content('4 sets of 25 reps for 00:05:10')
        end
      end
    end
  end
end
