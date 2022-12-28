class Car < ApplicationRecord
	belongs_to :office
	has_many_attached :photos

	validate :only_4_pictures

  def only_4_pictures
    errors.add(:photos, "You should upload six photos to each car") if photos.length != 6 
  end
end
