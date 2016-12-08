class Operators::BaseController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  before_action :comments_counter

	layout 'operators/layouts/application'

	def comments_counter
		@post_comment_counter = Shop::Comment.where(:commentable_type => "Shop::Post", :is_read => nil).count
		@product_comment_counter = Shop::Comment.where(:commentable_type => "Shop::Product", :is_read => nil).count
	end

end
