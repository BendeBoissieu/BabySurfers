class AddUserOneAndUserTwotoMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :user_one_id, :integer
    add_column :matches, :user_two_id, :integer
  end
end
