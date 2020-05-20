# == Schema Information
#
# Table name: activities
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  archived_at :datetime
#

require 'rails_helper'

RSpec.describe Activity, :type => :model do
  let(:activity) { FactoryBot.create(:activity) }

  let(:current_time) { Time.zone.local(2020, 05, 06) }
  describe '#archive!' do
    subject { activity }
    it 'updates_the archive_at field to the current time' do
      Timecop.freeze(current_time) do
        expect { subject.archive! }.to change { subject.archived_at }.from(nil).to (current_time)
      end
    end
  end
end
