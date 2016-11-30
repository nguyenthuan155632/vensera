class AddCommentableToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :shop_comments, :commentable, polymorphic: true
  end
end
 