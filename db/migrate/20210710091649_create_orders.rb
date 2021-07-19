class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :payment_type
      t.integer :order_ref

      t.timestamps
    end
  end
end
