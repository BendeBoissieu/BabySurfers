class RemovelocalisationRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :localisation, :string
    add_column :rentals, :address, :string
  end
end
