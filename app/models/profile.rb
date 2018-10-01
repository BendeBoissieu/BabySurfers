class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :photoprofile, PhotoUploader
end
