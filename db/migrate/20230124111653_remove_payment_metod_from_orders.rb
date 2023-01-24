class RemovePaymentMetodFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :payment_metod, :integer
  end
end
