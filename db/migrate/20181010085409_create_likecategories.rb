class CreateLikecategories < ActiveRecord::Migration[5.2]
  def change
    create_table :likecategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
