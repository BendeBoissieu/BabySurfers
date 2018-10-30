class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :last_opened_id
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
