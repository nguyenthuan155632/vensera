class CreateShopPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_posts do |t|
      t.string :title
      t.string :slug
      t.string :thumbnail
      t.text :content
      t.boolean :active
      t.references :shop_category, foreign_key: true

      t.timestamps
    end
  end
end
