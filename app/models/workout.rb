# == Schema Information
#
# Table name: workouts
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Workout < ApplicationRecord
  belongs_to :user
end
