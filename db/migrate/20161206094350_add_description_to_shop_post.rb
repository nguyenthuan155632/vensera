class AddDescriptionToShopPost < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_posts, :description, :text
  end
end
