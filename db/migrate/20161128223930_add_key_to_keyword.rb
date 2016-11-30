class AddKeyToKeyword < ActiveRecord::Migration[5.0]
  def change
    add_reference :shop_keywords, :key, polymorphic: true
  end
end
