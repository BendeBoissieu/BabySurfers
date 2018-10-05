class RemoveUserToMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :user_id, :integer
  end
end
