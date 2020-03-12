# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

class Activity < ApplicationRecord
  has_many :exercises
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user, case_sensitive: false }
end
