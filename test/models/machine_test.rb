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

require 'test_helper'

class MachineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
