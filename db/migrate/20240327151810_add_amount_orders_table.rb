class AddAmountOrdersTable < ActiveRecord::Migration[7.0]
  def change
    add_monetize :orders, :amount, currency: { present: false }
  end
end
