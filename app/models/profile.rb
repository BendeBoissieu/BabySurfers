class Profile < ApplicationRecord
  belongs_to :user, :dependent => :delete
  has_many :profile_likecategories
  has_many :likecategories, through: :profile_likecategories
  mount_uploader :photoprofile, PhotoUploader
  geocoded_by :address
  before_create :init_picture
  after_validation :geocode, if: :will_save_change_to_address?


  SURF_LEVEL = ["very baby (I never surf)", "baby (I tried one time)", "super baby (I know the takeoff)", "papy (I am surfing good waves)", "super papy (I did a tube)", "papy pro (I am Kelly Slater)"]
  I_LIKE = ["beers", "BBQ", "coffee", "blabla", "volley-ball", "chill", "other ideas?"]
  BOARD_TYPE = ["no board", "soft board", "hard board"]
  TYPE_OF_RENTAL = ["surfboard", "paddle"]

  def init_picture
    unless user.profile_picture.nil?
      self.photoprofile = user.profile_picture
    end
  end

end
