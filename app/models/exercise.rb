# == Schema Information
#
# Table name: exercises
#
#  id            :bigint           not null, primary key
#  reps          :integer
#  sets          :integer
#  weight_value  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  units         :string
#  distance      :integer
#  distance_unit :string
#  activity_id   :bigint
#  bodyweight    :boolean
#  hours         :integer
#  minutes       :integer
#  seconds       :integer
#

class Exercise < ApplicationRecord
  belongs_to :activity
  POSSIBLE_WEIGHT_UNITS = ['lbs', 'kg', 'units']
  validates :reps, :sets, presence: true
  validate :weight_value_or_bodyweight

  private
  def weight_value_or_bodyweight
    if !bodyweight && weight_value.nil?
      errors.add(:weight_value, 'must be present if not a bodyweight exercise')
    end
  end
end
