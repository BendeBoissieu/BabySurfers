class CreateProfileLikecategories < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_likecategories do |t|
      t.references :profile, foreign_key: true
      t.references :likecategory, foreign_key: true

      t.timestamps
    end
  end
end
