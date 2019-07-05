class Rental < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PhotoUploader
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_address?
end
