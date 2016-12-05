class Operators::ProductsController < Operators::BaseController
	before_action :get_resources, only: [:index]
	before_action :get_products, only: [:index]
	before_action :set_product, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@product = Shop::Product.new
		@product.build_keyword
		@product.images.build
	end

	def create 
		images_attr = params[:shop_product][:images_attributes]
		upload_thumnail = params[:shop_product][:thumbnail]
		img = []
		images_attr.each do |k, v|
			if v[:img_url].present?
				img << v[:img_url]
				params[:shop_product][:images_attributes][k][:img_url] = params[:shop_product][:images_attributes][k][:img_url].original_filename
			end
		end
		if params[:shop_product][:thumbnail].present?
			params[:shop_product][:thumbnail] = params[:shop_product][:thumbnail].original_filename
		end

		@product = Shop::Product.new(shop_product_params)

    if @product.save
    	File.open(Rails.root.join('public', 'uploads', upload_thumnail.original_filename), 'wb') do |file|
			  file.write(upload_thumnail.read)
			end
			img.each do |f|
				File.open(Rails.root.join('public', 'uploads', f.original_filename), 'wb') do |files|
				  files.write(f.read)
				end
			end
    	flash[:success] = "New product created successfully!"
      redirect_to operators_products_new_path
    else
      render :new
    end
	end

	def edit
	end

	def update
		images_attr = params[:shop_product][:images_attributes]
		if params[:shop_product][:thumbnail].present?
			upload_thumnail = params[:shop_product][:thumbnail]
		end
		img = []
		images_attr.each do |k, v|
			if v[:img_url].present?
				img << v[:img_url]
				params[:shop_product][:images_attributes][k][:img_url] = params[:shop_product][:images_attributes][k][:img_url].original_filename
			end
		end
		if params[:shop_product][:thumbnail].present?
			params[:shop_product][:thumbnail] = params[:shop_product][:thumbnail].original_filename
		end

    if @product.update_attributes(shop_product_params)
    	if params[:shop_product][:thumbnail].present?
    		File.open(Rails.root.join('public', 'uploads', upload_thumnail.original_filename), 'wb') do |file|
			  	file.write(upload_thumnail.read)
				end
			end  
			img.each do |f|
				File.open(Rails.root.join('public', 'uploads', f.original_filename), 'wb') do |files|
				  files.write(f.read)
				end
			end
    	flash[:success] = "New product updated successfully!"
      redirect_to operators_products_edit_path
    else
      render :edit
    end
	end

	def destroy
		@product.destroy
		flash[:success] = "Product deleted successfully!"
  	redirect_to operators_products_path
	end

	def delete_selected
		Shop::Product.where(:id => params[:ids]).destroy_all
		flash[:success] = "Products deleted successfully!"
		redirect_to operators_products_path
	end

	private

		def get_resources
			@categories = Shop::Category.where(:category_type => "product")
		end	

		def get_products
			@q = Shop::Product.ransack(params[:q])
  		@products = @q.result(distinct: true).includes(:category, :keyword).order(created_at: :desc).page(params[:page]).per(10)
		end

		def set_product 
			@product = Shop::Product.find(params[:id])
		end

		def shop_product_params
      params.require(:shop_product).permit(:product_name, :product_slug, :price, :quantity, :thumbnail, :description, :detail, :active, :shop_category_id, keyword_attributes: [:key_string, :key_id, :key_type], images_attributes: [:id, :img_url, :imageable_id, :imageable_type, :_destroy])
    end
end