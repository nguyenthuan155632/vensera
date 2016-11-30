class CreateShopOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_order_items do |t|
      t.references :shop_product, foreign_key: true
      t.references :shop_order, foreign_key: true
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
