class Operators::PostsController < Operators::BaseController
	before_action :get_resources, only: [:index]
	before_action :get_posts, only: [:index]
	before_action :set_post, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@post = Shop::Post.new
		@post.build_keyword
		@post.images.build
	end

	def create 
		images_attr = params[:shop_post][:images_attributes]
		upload_thumnail = params[:shop_post][:thumbnail]
		img = []
		images_attr.each do |k, v|
			if v[:img_url].present?
				img << v[:img_url]
				params[:shop_post][:images_attributes][k][:img_url] = params[:shop_post][:images_attributes][k][:img_url].original_filename
			end
		end
		if params[:shop_post][:thumbnail].present?
			params[:shop_post][:thumbnail] = params[:shop_post][:thumbnail].original_filename
		end

		@post = Shop::Post.new(shop_post_params)

    if @post.save
    	File.open(Rails.root.join('public', 'uploads', upload_thumnail.original_filename), 'wb') do |file|
			  file.write(upload_thumnail.read)
			end
			img.each do |f|
				File.open(Rails.root.join('public', 'uploads', f.original_filename), 'wb') do |files|
				  files.write(f.read)
				end
			end
    	flash[:success] = "New post created successfully!"
      redirect_to operators_posts_new_path
    else
      render :new
    end
	end

	def edit
	end

	def update
		images_attr = params[:shop_post][:images_attributes]
		if params[:shop_post][:thumbnail].present?
			upload_thumnail = params[:shop_post][:thumbnail]
		end
		img = []
		images_attr.each do |k, v|
			if v[:img_url].present?
				img << v[:img_url]
				params[:shop_post][:images_attributes][k][:img_url] = params[:shop_post][:images_attributes][k][:img_url].original_filename
			end
		end
		if params[:shop_post][:thumbnail].present?
			params[:shop_post][:thumbnail] = params[:shop_post][:thumbnail].original_filename
		end

    if @post.update_attributes(shop_post_params)
    	if params[:shop_post][:thumbnail].present?
    		File.open(Rails.root.join('public', 'uploads', upload_thumnail.original_filename), 'wb') do |file|
			  	file.write(upload_thumnail.read)
				end
			end  
			img.each do |f|
				File.open(Rails.root.join('public', 'uploads', f.original_filename), 'wb') do |files|
				  files.write(f.read)
				end
			end
    	flash[:success] = "New post updated successfully!"
      redirect_to operators_posts_edit_path
    else
      render :edit
    end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post deleted successfully!"
  	redirect_to operators_posts_path
	end

	def delete_selected
		Shop::Post.where(:id => params[:ids]).destroy_all
		flash[:success] = "Posts deleted successfully!"
		redirect_to operators_posts_path
	end

	private

		def get_resources
			@categories = Shop::Category.where(:category_type => "post")
		end	

		def get_posts
			@q = Shop::Post.ransack(params[:q])
  		@posts = @q.result(distinct: true).includes(:category, :keyword).order(created_at: :desc).page(params[:page]).per(10)
		end

		def set_post 
			@post = Shop::Post.find(params[:id])
		end

		def shop_post_params
      params.require(:shop_post).permit(:title, :slug, :thumbnail, :content, :active, :shop_category_id, keyword_attributes: [:key_string, :key_id, :key_type], images_attributes: [:id, :img_url, :imageable_id, :imageable_type, :_destroy])
    end
end