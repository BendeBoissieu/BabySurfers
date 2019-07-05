class Rental < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  mount_uploader :picture, PhotoUploader
end
