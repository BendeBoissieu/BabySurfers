class AddPhotoprofileToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :photoprofile, :string
  end
end
