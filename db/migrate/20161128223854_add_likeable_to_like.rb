class AddLikeableToLike < ActiveRecord::Migration[5.0]
  def change
    add_reference :shop_likes, :likeable, polymorphic: true
  end
end
