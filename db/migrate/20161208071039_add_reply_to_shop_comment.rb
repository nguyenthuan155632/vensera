class AddReplyToShopComment < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_comments, :reply, :integer
  end
end
