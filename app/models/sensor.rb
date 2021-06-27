class Sensor < ApplicationRecord

  belongs_to :battle
  belongs_to :ship, optional: true

  scope :result_greather_than_or_equal_to, -> (number) { where('"sensors"."result" >= ?', number) }
end
