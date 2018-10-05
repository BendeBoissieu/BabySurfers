class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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

end
