class Location < ApplicationRecord
  has_many :pickup_bookings, class_name: 'Booking', foreign_key: :pickup_location_id, dependent: :nullify
  has_many :dropoff_bookings, class_name: 'Booking', foreign_key: :dropoff_location_id, dependent: :nullify
  
  enum location_type: { station: 0, hub: 1, stop: 2, landmark: 3 }
  
  validates :name, :latitude, :longitude, presence: true
  
  def distance_to(other_location)
    Geocoder::Calculations.distance_between([latitude, longitude], [other_location.latitude, other_location.longitude])
  end
end
