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
#  duration      :integer
#  duration_unit :string
#  distance      :integer
#  distance_unit :string
#  activity_id   :bigint
#

class Exercise < ApplicationRecord
  belongs_to :activity
  POSSIBLE_WEIGHT_UNITS = ['lbs', 'kg', 'units']
  validates :reps, :sets, :weight_value, presence: true

end
