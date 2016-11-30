class CreateShopLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_likes do |t|
      t.integer :counter
      t.integer :like_number

      t.timestamps
    end
  end
end
