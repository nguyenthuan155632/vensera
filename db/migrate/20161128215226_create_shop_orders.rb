class CreateShopOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_orders do |t|
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :shipping
      t.decimal :total
      t.references :shop_order_status, foreign_key: true

      t.timestamps
    end
  end
end
