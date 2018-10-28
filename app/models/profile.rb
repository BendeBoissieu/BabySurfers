class Profile < ApplicationRecord
  belongs_to :user, :dependent => :delete
  has_many :profile_likecategories
  has_many :likecategories, through: :profile_likecategories
  mount_uploader :photoprofile, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  SURF_LEVEL = ["very baby", "baby", "super baby", "papy", "super papy", "papy pro"]
  I_LIKE = ["beers", "BBQ", "coffee", "blabla", "volley-ball", "chill", "other ideas?"]
  BOARD_TYPE = ["no board", "soft board", "hard board"]




end
