class RemoveLocationfromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :address, :text
    add_column :profiles, :address, :string
  end
end
