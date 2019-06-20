class AddLocalisationsToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :localisation, :string
  end
end
