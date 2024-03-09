class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :description
      t.integer :membership
      t.string :location
      t.string :city
      t.string :phone_number
      t.string :state
      t.string :zip_code
      t.string :licence_number

      t.timestamps
    end
  end
end
