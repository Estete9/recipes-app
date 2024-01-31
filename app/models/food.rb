class Food < ApplicationRecord
  belongs_to :user
  def name_with_measurement_unit
    "#{name} (#{measurement_unit})"
  end
end
