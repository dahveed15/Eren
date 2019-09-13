require 'rails_helper'

RSpec.describe 'Add Machine page', type: :feature, js: true do

  context 'with a previous machine already created' do
    let!(:benchpress_machine) { Machine.create(name: 'benchpress') }

    scenario 'index page' do
      visit new_machines_exercises_path
      fill_in('exercise[reps]', :with => '10')
      fill_in('exercise[sets]', :with => '3')
      find_button('Create Exercise').click
      expect(page).to have_content('3 sets of 10 reps')
      expect(benchpress_machine.exercises.count).to eq(1)
    end
  end
end
