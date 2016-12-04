class Operators::PostsController < Operators::BaseController
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
			img << v[:img_url]
			params[:shop_post][:images_attributes][k][:img_url] = params[:shop_post][:images_attributes][k][:img_url].original_filename
		end
		params[:shop_post][:thumbnail] = params[:shop_post][:thumbnail].original_filename

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

	private
		def shop_post_params
      params.require(:shop_post).permit(:title, :slug, :thumbnail, :content, :active, :shop_category_id, keyword_attributes: [:key_string, :key_id, :key_type], images_attributes: [:img_url, :imageable_id, :imageable_type])
    end
end