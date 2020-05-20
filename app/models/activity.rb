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

class Activity < ApplicationRecord
  has_many :exercises
  belongs_to :user
  validates :name, presence: true
  validate :name_is_unique
  scope :unarchived, -> { where(archived_at: nil) }

  def archive!
    update!(archived_at: Time.zone.now)
  end

  def name_is_unique
    if name_changed?
      if user.activities.where("replace(name, ' ', '') ILIKE replace(?, ' ', '')", name).length > 0
        errors.add(:name, 'Activity already exists')
      end
    end
  end
end
