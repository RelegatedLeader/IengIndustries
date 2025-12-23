class Route < ApplicationRecord
  belongs_to :vehicle
  belongs_to :start_location, class_name: 'Location', optional: true
  belongs_to :end_location, class_name: 'Location', optional: true
  
  enum status: { active: 0, inactive: 1, under_maintenance: 2 }
  
  validates :name, :vehicle_id, presence: true
end
