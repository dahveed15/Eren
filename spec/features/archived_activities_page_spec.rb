require 'rails_helper'

RSpec.describe 'Archived Activities page', type: :feature, js: true do
    let!(:user) { FactoryBot.create(:user) }
    let!(:benchpress_activity) { Activity.create(name: 'benchpress', user: user, archived_at: Time.zone.now) }

    it 'shows a list of Archived Activities' do
      log_in(user)
      visit archived_activities_path
      expect(page).to have_content('benchpress')
    end
end
