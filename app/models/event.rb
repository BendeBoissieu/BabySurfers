class Event < ApplicationRecord
  belongs_to :user
  has_many :discussions
  has_many :joins
end
