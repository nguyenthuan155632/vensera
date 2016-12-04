class Operators::PostsController < Operators::BaseController
	def index
	end

	def new
		@post = Shop::Post.new
	end

	def create 
		@post = Shop::Post.new(shop_post_params)
    if @post.save
    	flash[:success] = "New post created successfully!"
      redirect_to operators_posts_new_path
    else
      render :new
    end
	end

	private
		def shop_post_params
      params.require(:shop_post).permit(:title, :slug, :thumbnail, :content, :active, :shop_category_id)
    end
end