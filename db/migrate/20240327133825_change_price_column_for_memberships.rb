class ChangePriceColumnForMemberships < ActiveRecord::Migration[7.0]
  def change
    remove_column :memberships, :price, :float
    add_monetize :memberships, :price, currency: { present: false }
  end
end
