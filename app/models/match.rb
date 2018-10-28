class Match < ApplicationRecord
  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User'
  validates :user_one, uniqueness: { scope: :user_two }


  def other_user(test_user)
    [user_one, user_two].each do |user|
      if user != test_user
        return user
      end
    end
  end

  def this_user(test_user)
    [user_one, user_two].each do |user|
      if user == test_user
        return user
      end
    end
  end

  def name
    id
  end


end
