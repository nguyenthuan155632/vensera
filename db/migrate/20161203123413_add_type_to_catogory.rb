class AddTypeToCatogory < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_categories, :category_type, :string
  end
end
