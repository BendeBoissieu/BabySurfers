class Match < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :mutual, :boolean, default: false
  end
end
