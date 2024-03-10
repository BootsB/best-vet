class RemoveColumnNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :phone_number, :string
    remove_column :users, :state, :string
    remove_column :users, :zip_code, :string
  end
end
