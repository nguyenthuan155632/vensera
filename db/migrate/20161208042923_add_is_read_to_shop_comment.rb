class AddIsReadToShopComment < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_comments, :is_read, :boolean
  end
end
