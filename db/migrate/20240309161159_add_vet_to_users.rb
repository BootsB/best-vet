class AddVetToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vet, :boolean
  end
end
