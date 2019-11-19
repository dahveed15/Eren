# == Schema Information
#
# Table name: exercises
#
#  id           :bigint           not null, primary key
#  reps         :integer          not null
#  sets         :integer          default(1), not null
#  weight_value :integer          not null
#  machine_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  units        :string
#

class Exercise < ApplicationRecord
  belongs_to :machine
  POSSIBLE_WEIGHT_UNITS = ['lbs', 'kg', 'units']

end
