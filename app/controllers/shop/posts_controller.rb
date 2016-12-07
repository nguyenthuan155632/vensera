class Shop::PostsController < Shop::BaseController
	before_action :get_all_posts, only: [:index]
	before_action :get_post, only: [:show]

	def index
	end

	def show
	end

	def likes
		if params[:id].present? && params[:rate].present?
			like = Shop::Like.new({ like_number: params[:rate], likeable_type: "Shop::Post", likeable_id: params[:id] })
			like.save
		end
	end

	private
		def get_all_posts
			@posts = Shop::Post.where(:active => "publish").order(created_at: :desc).page(params[:page]).per(5)
		end

		def get_post
			@post = Shop::Post.where(:active => "publish").find(params[:id])
		end
end	