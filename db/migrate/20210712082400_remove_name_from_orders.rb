class RemoveNameFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :name, :string
  end
end
