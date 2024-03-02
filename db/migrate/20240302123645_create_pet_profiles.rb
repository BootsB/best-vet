class CreatePetProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_profiles do |t|
      t.integer :age
      t.string :species
      t.string :gender
      t.text :description
      t.string :vaccinations
      t.boolean :neutered
      t.string :name
      t.string :breed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
