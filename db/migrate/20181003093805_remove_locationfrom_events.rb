class RemoveLocationfromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :location, :text
    add_column :events, :location, :string
  end
end
