require 'rails_helper'

RSpec.describe 'Splash page', type: :feature, js: true do
  let!(:user) { FactoryBot.create(:user) }
  let!(:another_user) { FactoryBot.create(:user, email: 'another_user@test.com') }

  scenario 'index page' do
    log_in(user)
    visit root_path
    expect(page).to have_content("Signed in as: #{user.email}")
    expect(page).to have_content('Welcome to Eren, the best app ever!')
    find_link('Add Activity').click
    expect(page).to have_content('Add Activity')
  end

  context 'with a activity created' do
    let!(:benchpress_activity) { Activity.create(name: 'benchpress', user: user) }

    scenario 'add an exercise' do
      log_in(user)
      visit root_path
      expect(page).to have_content(benchpress_activity.name)
      find_link('Add Exercise').click
      expect(page).to have_content('Add an Exercise for benchpress')
    end

    scenario 'as another user' do
      log_in(another_user)
      visit root_path
      expect(page).not_to have_content(benchpress_activity.name)
    end

    scenario 'navigate to activity show' do
      log_in(user)
      visit root_path
      find_link('benchpress').click
      expect(page).to have_content('No exercises found.')
    end
  end
end
