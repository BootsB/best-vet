class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end
end
