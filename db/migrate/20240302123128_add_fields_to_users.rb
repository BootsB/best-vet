class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vet, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :location, :string
    add_column :users, :city, :string
    add_column :users, :description, :text
    add_column :users, :membership, :integer
  end
end
