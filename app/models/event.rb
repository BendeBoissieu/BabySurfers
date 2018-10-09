class Event < ApplicationRecord
  belongs_to :user
  has_many :discussions, :dependent => :delete_all
  has_many :joins, :dependent => :delete_all
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
