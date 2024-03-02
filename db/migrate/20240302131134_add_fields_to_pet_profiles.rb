class AddFieldsToPetProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :pet_profiles, :weight, :float
    add_column :pet_profiles, :microchip, :boolean
  end
end
