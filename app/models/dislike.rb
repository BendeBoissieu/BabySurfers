class Dislike < ApplicationRecord
  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User'
  validates :user_one, uniqueness: { scope: :user_two }
end
