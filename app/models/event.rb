class Event < ApplicationRecord
  belongs_to :user
  has_many :discussions
  has_many :joins
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
