class Game < ApplicationRecord
  validates :name, presence: true

  has_many :bookings
  has_many :figurines, through: :bookings
end
