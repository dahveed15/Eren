require 'rails_helper'

RSpec.describe 'Splash page', type: :feature, js: true do
  let!(:user) { FactoryBot.create(:user) }


    describe 'options page' do
      it 'has a link to the Archived Activities page' do
        log_in(user)
        visit root_path
        find_link('Options').click
        find_link('Archived Activities').click
        expect(page).to have_content('Archived Activities')
      end
    end
end
