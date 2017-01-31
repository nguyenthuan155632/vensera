class Shop::ProductsController < Shop::BaseController
	before_action :get_all_products, only: [:index]
	before_action :get_product, only: [:show]
	before_action :get_comments, only: [:show]

	def index
		@order_item = current_order.order_items.new
	end

	def show
	end

	def likes
		if params[:id].present? && params[:rate].present?
			like = Shop::Like.new({ like_number: params[:rate], likeable_type: "Shop::Product", likeable_id: params[:id] })
			like.save
		end
	end

	def comments
		# name = params[:name]
		# email = params[:email]
		# phone = params[:phone]
		# comment = params[:comment]
		# cm = Shop::Comment.new({ content: comment, name: name, email: email, phone: phone, commentable_type: "Shop::Post", commentable_id: params[:id] })
		# cm.save
	end

	private
		def get_all_products
			@products = Shop::Product.where(:active => "publish").order(created_at: :desc).page(params[:page]).per(12)
		end

		def get_product
			@product = Shop::Product.where(:active => "publish").find(params[:id])
			@random_product_1 = Shop::Product.limit(3).order("RANDOM()")
			@random_product_2 = Shop::Product.limit(3).where(:shop_category_id => @product.shop_category_id).order("RANDOM()")
			# @random_pr oduct_3 = Shop::Product.where(:shop_category_id => @product.shop_category_id).limit(3).order("RANDOM()")
		end

		def get_comments
			@comments = Shop::Comment.where(:commentable_type => "Shop::Product", :commentable_id => params[:id], :reply => nil).order(created_at: :asc)
			@Time = Time.now.in_time_zone("Asia/Bangkok").strftime("%I:%M%p")
			@Date = Time.now.in_time_zone("Asia/Bangkok").strftime("%b %d, %Y")
		end
end