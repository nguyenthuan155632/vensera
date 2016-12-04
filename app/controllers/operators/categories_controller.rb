class Operators::CategoriesController < Operators::BaseController
	before_action :get_categories, only: [:index]
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@category = Shop::Category.new
	end	

	def create 
		@category = Shop::Category.new(shop_category_params)
    if @category.save
    	flash[:success] = "New category created successfully!"
      redirect_to operators_categories_new_path
    else
      render :new
    end
	end

	def edit
	end

	def update
		if @category.update_attributes(shop_category_params)
      flash[:success] = "Category updated successfully!"
      redirect_to operators_categories_edit_path
    else
      render :edit
    end	
	end

	def destroy
		@category.destroy
		flash[:success] = "Category deleted successfully!"
    redirect_to operators_categories_path
	end

	def delete_selected
		Shop::Category.where(:id => params[:ids]).destroy_all
		flash[:success] = "Categories deleted successfully!"
		redirect_to operators_categories_path
	end

	private
		def get_categories
			@q = Shop::Category.ransack(params[:q])
  		@categories = @q.result(distinct: true).order(created_at: :asc).page(params[:page]).per(10)
			# @categories = Shop::Category.all.order(created_at: :asc).page(params[:page]).per(10)
		end

		def set_category 
			@category = Shop::Category.find(params[:id])
		end

		def shop_category_params
      params.require(:shop_category).permit(:category_name, :category_slug, :category_type)
    end
end