class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title_event
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.text :location
      t.string :photo_event
      t.string :organiser
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
