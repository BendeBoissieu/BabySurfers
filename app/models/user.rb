class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: [:facebook]
  has_many :events
  has_one :profile, dependent: :destroy
  after_create :init_profile
  after_save :write_json


  def init_profile
    self.create_profile!
  end

  def write_json
    events_json = []
    User.all.each do |event|
            event_json = {
            "id" => event.id,
            "first_name" => event.first_name
            }
            events_json << event_json
    end
    File.open("public/event.json","w") do |f|
      f.write(events_json.to_json)
    end
  end

  def self.from_facebook(auth)
  where(facebook_id: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    #user.provider = auth.provider
    #user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name
    user.profile_picture = auth.info.image
    #user.skip_confirmation!
    end
  end

end

