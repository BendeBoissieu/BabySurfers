class AddOrganiserIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :organiser_id, :integer
  end
end
