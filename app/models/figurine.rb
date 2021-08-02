class Figurine < ApplicationRecord
  validates :name, presence: true
  validate :acceptable_reference_picture
  validate :acceptable_painted_picture
  validate :acceptable_portrait

  has_one_attached :reference_picture
  has_one_attached :painted_picture
  has_one_attached :portrait

  belongs_to :universe, optional: true
  belongs_to :artist, optional: true

  # TO DO : refacto the image validations

  def acceptable_reference_picture
    return unless reference_picture.attached?

    unless reference_picture.byte_size <= 1.megabyte
      errors.add(:reference_picture, "doit faire moins de 1Mb")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(reference_picture.content_type)
      errors.add(:reference_picture, "doit être un JPEG ou PNG")
    end
  end

  def acceptable_painted_picture
    return unless painted_picture.attached?

    unless painted_picture.byte_size <= 1.megabyte
      errors.add(:painted_picture, "doit faire moins de 1Mb")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(painted_picture.content_type)
      errors.add(:painted_picture, "doit être un JPEG ou PNG")
    end
  end

  def acceptable_portrait
    return unless portrait.attached?

    unless portrait.byte_size <= 1.megabyte
      errors.add(:portrait, "doit faire moins de 1Mb")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(portrait.content_type)
      errors.add(:portrait, "doit être un JPEG ou PNG")
    end
  end

  def painted?
    painted_picture.present?
  end

  def reserved?
    artist.present?
  end

  def portrayed?
    portrait.present?
  end
end
