class Speciality < ApplicationRecord
  validates :name, presence: true

  has_many :figurine_specialities, dependent: :destroy
  has_many :figurines, through: :figurine_specialities
end
