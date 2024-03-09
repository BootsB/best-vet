class RemoveFieldsNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :vet, :boolean
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :address, :string
    remove_column :users, :location, :string
    remove_column :users, :city, :string
    remove_column :users, :description, :string
    remove_column :users, :membership, :string
    remove_column :users, :veterinary, :boolean
  end
end
