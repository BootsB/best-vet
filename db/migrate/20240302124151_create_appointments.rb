class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet_profile, null: false, foreign_key: true
      t.date :appointment_date
      t.string :status
      t.time :appointment_time
      t.text :description_of_problem

      t.timestamps
    end
  end
end
