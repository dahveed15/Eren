require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do

  context 'with a previous machine already created' do
    let!(:benchpress_machine) { Machine.create(name: 'benchpress') }

    scenario 'index page' do
      visit new_machine_exercise_path(benchpress_machine)
      fill_in('exercise[reps]', :with => '10')
      fill_in('exercise[sets]', :with => '3')
      fill_in('exercise[weight_value]', :with => '120')
      select('kg', :from => 'exercise[units]')
      find_button('Create Exercise').click
      expect(benchpress_machine.exercises.count).to eq(1)
      expect(page).to have_content('3 sets of 10 reps at 120 kg')

    end
  end
end
