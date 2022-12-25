class RemoveFirstFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :first, :string
  end
end
