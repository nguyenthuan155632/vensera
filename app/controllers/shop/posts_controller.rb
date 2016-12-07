class Shop::PostsController < Shop::BaseController
	before_action :get_all_posts, only: [:index]
	before_action :get_post, only: [:show]
	before_action :get_comments, only: [:show]

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

	def comments
		name = params[:name]
		email = params[:email]
		phone = params[:phone]
		comment = params[:comment]
		cm = Shop::Comment.new({ content: comment, name: name, email: email, phone: phone, commentable_type: "Shop::Post", commentable_id: params[:id] })
		cm.save
	end

	private
		def get_all_posts
			@posts = Shop::Post.where(:active => "publish").order(created_at: :desc).page(params[:page]).per(5)
		end

		def get_post
			@post = Shop::Post.where(:active => "publish").find(params[:id])
		end

		def get_comments
			@comments = Shop::Comment.where(:commentable_id => params[:id]).order(created_at: :asc)
			@Time = Time.now.in_time_zone("Asia/Bangkok").strftime("%I:%M%p")
			@Date = Time.now.in_time_zone("Asia/Bangkok").strftime("%b %d, %Y")
		end
end	