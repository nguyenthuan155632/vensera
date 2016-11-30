class CreateShopComments < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_comments do |t|
      t.text :content

      t.timestamps
    end
  end
end
