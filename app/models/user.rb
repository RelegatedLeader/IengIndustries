class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :vehicles, foreign_key: :driver_id, dependent: :nullify
  
  enum :role, { user: 0, driver: 1, admin: 2, support: 3 }, prefix: false
  
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
end
