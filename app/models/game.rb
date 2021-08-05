class Game < ApplicationRecord
  validates :name, presence: true

  has_many :bookings, dependent: :destroy
  has_many :figurines, through: :bookings

  def name_with_date
    game_date ? "#{name} - #{game_date.strftime('%d/%m/%Y')}" : name
  end
end
