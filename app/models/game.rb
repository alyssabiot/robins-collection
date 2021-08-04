class Game < ApplicationRecord
  validates :name, presence: true

  has_many :bookings, dependent: :destroy
  has_many :figurines, through: :bookings
end
