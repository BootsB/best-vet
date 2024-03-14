class AddVetIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :vet_id, :integer
  end
end
