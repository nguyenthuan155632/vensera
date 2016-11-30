class AddImageableToImage < ActiveRecord::Migration[5.0]
  def change
    add_reference :shop_images, :imageable, polymorphic: true
  end
end
