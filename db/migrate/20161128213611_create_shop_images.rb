class CreateShopImages < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_images do |t|
      t.string :img_url

      t.timestamps
    end
  end
end
