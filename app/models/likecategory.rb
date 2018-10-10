class Likecategory < ApplicationRecord
  has_many :profile_likecategories
  has_many :profiles, through: :profile_likecategories
end
