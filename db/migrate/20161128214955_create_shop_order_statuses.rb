class CreateShopOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_order_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
