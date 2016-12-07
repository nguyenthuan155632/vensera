class AddSomeFieldToShopComment < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_comments, :name, :string
    add_column :shop_comments, :email, :string
    add_column :shop_comments, :phone, :string
  end
end
