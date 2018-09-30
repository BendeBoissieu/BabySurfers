class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :email
      t.text :address
      t.integer :phone
      t.string :background_profile
      t.date :birth_date
      t.string :board_type
      t.string :need_to_rent
      t.string :surf_level
      t.string :favorite_beach
      t.string :i_like
      t.text :description_user
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
