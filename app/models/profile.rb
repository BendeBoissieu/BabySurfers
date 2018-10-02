class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :photoprofile, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
