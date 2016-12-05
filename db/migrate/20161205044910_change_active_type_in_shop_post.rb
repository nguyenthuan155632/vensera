class ChangeActiveTypeInShopPost < ActiveRecord::Migration[5.0]
  def change
  	change_column :shop_posts, :active, :string
  end
end
