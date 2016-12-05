class ChangeCategoryIdToShopCategoryIdInPost < ActiveRecord::Migration[5.0]
  def change
  	rename_column :shop_posts, :category_id, :shop_category_id
  end
end
