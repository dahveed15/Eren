# == Schema Information
#
# Table name: machines
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

class Machine < ApplicationRecord
  has_many :exercises
  belongs_to :user
end
