class RemoveAmountIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :amount_id, :integer
  end
end
