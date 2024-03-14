class AddPetOwnerIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :pet_owner_id, :integer
  end
end
