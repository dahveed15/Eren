class Exercise < ApplicationRecord
  belongs_to :machine
  POSSIBLE_WEIGHT_UNITS = ['lbs', 'kg', 'units']

end
