class ChangeLikeNumberFromIntegerToFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column :shop_likes, :like_number, :float
  end
end
