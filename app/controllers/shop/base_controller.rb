class Shop::BaseController < ActionController::Base
	protect_from_forgery with: :exception

	layout 'shop/layouts/application'

	helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Shop::Order.find(session[:order_id])
    else
      Shop::Order.new
    end
  end
end
