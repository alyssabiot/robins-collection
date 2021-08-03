class Family < ApplicationRecord
  validates :name, presence: true

  has_many :figurines
end
