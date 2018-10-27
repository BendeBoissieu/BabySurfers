class CreateDislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dislikes do |t|
      t.integer :user_one_id
      t.integer :user_two_id

      t.timestamps
    end
  end
end
