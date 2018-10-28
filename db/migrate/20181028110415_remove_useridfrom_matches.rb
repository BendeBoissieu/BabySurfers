class RemoveUseridfromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_reference :matches, :user
  end
end
