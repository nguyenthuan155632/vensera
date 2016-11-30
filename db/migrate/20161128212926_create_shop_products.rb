class CreateShopProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_products do |t|
      t.string :product_name
      t.string :product_slug
      t.decimal :price
      t.integer :quantity
      t.string :thumbnail
      t.text :description
      t.text :detail
      t.boolean :active
      t.references :shop_category, foreign_key: true

      t.timestamps
    end
  end
end
