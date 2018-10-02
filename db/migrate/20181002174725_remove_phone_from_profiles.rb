class RemovePhoneFromProfiles < ActiveRecord::Migration[5.2]
      def change
    remove_column :profiles, :phone, :integer
  end

end
