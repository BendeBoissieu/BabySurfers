class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :category
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :phone
      t.integer :price
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
