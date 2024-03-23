class AddZoomLinkToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :zoom_link, :string
  end
end
