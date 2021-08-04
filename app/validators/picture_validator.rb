class PictureValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, picture)
    return unless picture.attached?

    unless picture.byte_size <= 1.megabyte
      record.errors.add(attribute, "doit faire moins de 1Mb")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(picture.content_type)
      record.errors.add(attribute, "doit être un JPEG ou PNG")
    end
  end
end
