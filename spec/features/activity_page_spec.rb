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

  describe 'back button' do
    scenario 'on click' do
      log_in(user)
      visit new_activity_path
      click_on(class: 'qa-back-button')
      expect(page).to have_content('Welcome to Eren')
    end
  end

  scenario 'when a user fills an activity with a similar name' do
    log_in(user)
    visit new_activity_path
    fill_in('activity[name]', :with => 'bench Press')
    find_button('Create Activity').click
    expect(page).to have_content("Activity already exists")
  end

  scenario 'another similar name' do
    log_in(user)
    visit new_activity_path
    fill_in('activity[name]', :with => 'BenchPress')
    find_button('Create Activity').click
    expect(page).to have_content("Activity already exists")
  end

  scenario 'create activity error handling' do
    log_in(user)
    visit new_activity_path
    find_button('Create Activity').click
    expect(page).to have_content("Name can't be blank")
  end

  describe 'activity show' do

    scenario 'it displays an edit Activity button' do
      log_in(user)
      visit activity_path(benchpress_activity)
      click_link('Edit Activity')
      fill_in('activity[name]', :with => 'Benchpress')
      find_button('Save').click
      expect(page).to have_content('Benchpress')
      expect(page).not_to have_content('benchpress')
    end

    scenario 'it displays a back button' do
      log_in(user)
      visit activity_path(benchpress_activity)
      click_on(class: 'qa-back-button')
      expect(page).to have_content('Welcome to Eren')
    end

    scenario 'it displays an archive button' do
      log_in(user)
      visit activity_path(benchpress_activity)
      click_link('Archive Activity')
      expect(page).not_to have_content('benchpress')
    end

    scenario 'when an activity does not have exercises' do
      log_in(user)
      visit activity_path(benchpress_activity)
      expect(page).not_to have_content('No exercises found for benchpress.')
    end

    describe 'when the activity is archived' do
      before do
        benchpress_activity.archive!
      end

      scenario 'it displays an unarchive activity button' do
        log_in(user)
        visit activity_path(benchpress_activity)
        expect(page).not_to have_content('Archive Activity')
        expect(page).not_to have_content('Edit Activity')
        expect(page).to have_content('Unarchive Activity')
      end
    end
  end

  describe 'activity edit page' do
    scenario 'it displays a back button to return to the activity show page' do
      log_in(user)
      visit activity_path(benchpress_activity)
      click_link('Edit Activity')
      click_on(class: 'qa-back-button')
      expect(page).to have_content('Archive Activity')
    end
  end
end
