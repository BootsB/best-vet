class ChangeFieldStatusTypeAppointment < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :status
    add_column :appointments, :status, :integer, default: 0
  end
end
