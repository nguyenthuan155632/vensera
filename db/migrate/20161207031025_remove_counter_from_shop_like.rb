class RemoveCounterFromShopLike < ActiveRecord::Migration[5.0]
  def change
  	remove_column :shop_likes, :counter, :interger
  end
end
