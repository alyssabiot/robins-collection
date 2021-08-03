class Booking < ApplicationRecord
  validates :player, presence: true

  belongs_to :game
  belongs_to :figurine
end
