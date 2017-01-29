class AddPaperclipToShopPost < ActiveRecord::Migration[5.0]
  def up
    add_attachment :shop_posts, :thumbnail
  end

  def down
    remove_attachment :shop_posts, :thumbnail
  end
end
