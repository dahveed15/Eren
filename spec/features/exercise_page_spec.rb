require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do

  context 'with a previous machine already created' do
    let(:user) { FactoryBot.create(:user) }
    let!(:benchpress_machine) { Machine.create(name: 'benchpress', user: user) }

    scenario 'index page' do
      log_in(user)
      visit new_machine_exercise_path(benchpress_machine)
      fill_in('exercise[reps]', :with => '10')
      fill_in('exercise[sets]', :with => '3')
      fill_in('exercise[weight_value]', :with => '120')
      select('kg', :from => 'exercise[units]')
      find_button('Create Exercise').click
      expect(benchpress_machine.exercises.count).to eq(1)
      expect(page).to have_content('3 sets of 10 reps at 120 kg')

    end

    context 'with an exercise already created' do
      let!(:previous_exercise) { benchpress_machine.exercises.create(reps: 12, sets: 5, weight_value: 100, units: 'kg')}
      scenario 'it prefills the input fields with the previous exercise data' do
        log_in(user)
        visit new_machine_exercise_path(benchpress_machine)
        expect(find_field('exercise[reps]').value).to eq('12')
        expect(find_field('exercise[sets]').value).to eq('5')
        expect(find_field('exercise[weight_value]').value).to eq('100')
        expect(find_field('exercise[units]').value).to eq('kg')
      end
    end

    scenario 'error handling' do
      log_in(user)
      visit new_machine_exercise_path(benchpress_machine)
      fill_in('exercise[sets]', :with => '')
      find_button('Create Exercise').click
      expect(page).to have_content("Reps can't be blank")
      expect(page).to have_content("Sets can't be blank")
      expect(page).to have_content("Weight value can't be blank")
    end
  end
end
