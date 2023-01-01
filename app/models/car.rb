class Car < ApplicationRecord
	belongs_to :office
	has_many_attached :photos

	validates :car_plate_number, uniqueness:true
	validates :car_plate_number, presence: true
	validates :manufacturer, presence: true
	validates :model, presence: true
	validates :manufacture_year, presence: true
	validates :manufacture_year, presence: true
	validates :renting_price, presence: true
	validates :available, presence: true

	validate :only_6_pictures

  def only_6_pictures
    errors.add(:photos, "You should upload six photos to each car") if photos.length != 6 
  end
  
end
