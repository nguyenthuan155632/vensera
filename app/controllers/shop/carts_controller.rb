class Shop::CartsController < Shop::BaseController
	def show
    @order_items = current_order.order_items
  end
end