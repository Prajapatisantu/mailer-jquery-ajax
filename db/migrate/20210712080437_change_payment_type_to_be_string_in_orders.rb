class ChangePaymentTypeToBeStringInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :payment_type, :string
  end
end
