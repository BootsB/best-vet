class ChangeMicrochipDataTypeInPetProfiles < ActiveRecord::Migration[7.0]
  def up
    change_column :pet_profiles, :microchip, 'boolean USING CASE WHEN microchip = \'true\' THEN TRUE ELSE FALSE END'
  end

  def down
    change_column :pet_profiles, :microchip, :string
  end
end
