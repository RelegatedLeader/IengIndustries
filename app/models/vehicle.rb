class Vehicle < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :routes, dependent: :destroy
  
  enum :vehicle_type, { hover_bus: 0, hover_taxi: 1, advanced_train: 2, teleport_chamber: 3 }
  enum :energy_type, { nuclear_fusion: 0, solar_hybrid: 1 }
  enum :status, { available: 0, in_transit: 1, maintenance: 2, offline: 3 }
  
  validates :name, :vehicle_type, :capacity, presence: true
  validates :license_plate, presence: true, uniqueness: true
end
