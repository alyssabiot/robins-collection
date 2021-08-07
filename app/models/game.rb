class Game < ApplicationRecord
  validates :name, presence: true

  has_many :bookings, dependent: :destroy
  has_many :figurines, through: :bookings

  # TO DO : refacto
  scope :available_for_figurine, ->(figurine) { Game.select { |g| !g.figurines.include?(figurine) } }

  def name_with_date
    game_date ? "#{name} - #{game_date.strftime('%d/%m/%Y')}" : name
  end
end
