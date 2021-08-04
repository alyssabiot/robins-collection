class Figurine < ApplicationRecord
  validates :name, presence: true
  validates :reference_picture, :painted_picture, :portrait, picture: true

  has_one_attached :reference_picture
  has_one_attached :painted_picture
  has_one_attached :portrait

  belongs_to :universe, optional: true
  belongs_to :artist, optional: true
  belongs_to :family, optional: true
  belongs_to :speciality, optional: true

  has_many :bookings, dependent: :destroy
  has_many :games, through: :bookings

  before_save :set_boolean_fields

  def set_boolean_fields
    self.is_painted = painted_picture.present?
    self.has_portrait = portrait.present?
  end
end
