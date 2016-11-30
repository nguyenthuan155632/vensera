class CreateShopKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_keywords do |t|
      t.string :key_string

      t.timestamps
    end
  end
end
