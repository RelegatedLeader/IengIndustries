class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :pickup_location, class_name: 'Location'
  belongs_to :dropoff_location, class_name: 'Location'
  has_many :reviews, dependent: :destroy
  
  enum :status, { pending: 0, confirmed: 1, in_progress: 2, completed: 3, cancelled: 4 }
  enum :payment_status, { unpaid: 0, awaiting_payment: 1, paid: 2, refunded: 3 }
  
  validates :user_id, :vehicle_id, :pickup_location_id, :dropoff_location_id, presence: true
  validates :passenger_count, numericality: { only_integer: true, greater_than: 0 }
  
  before_create :generate_confirmation_code
  before_save :calculate_fare
  
  def calculate_fare
    distance = pickup_location.distance_to(dropoff_location)
    self.estimated_fare = distance * (vehicle.hourly_rate / 60.0)
  end
  
  private
  
  def generate_confirmation_code
    self.confirmation_code = SecureRandom.alphanumeric(8).upcase
  end
end
