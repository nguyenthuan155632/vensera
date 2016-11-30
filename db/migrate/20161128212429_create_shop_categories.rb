class CreateShopCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_categories do |t|
      t.string :category_name
      t.string :category_slug

      t.timestamps
    end
  end
end
