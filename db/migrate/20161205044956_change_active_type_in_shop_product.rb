class ChangeActiveTypeInShopProduct < ActiveRecord::Migration[5.0]
  def change
  	change_column :shop_products, :active, :string
  end
end
