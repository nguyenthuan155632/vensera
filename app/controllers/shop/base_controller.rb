class Shop::BaseController < ActionController::Base
	protect_from_forgery with: :exception

	layout 'shop/layouts/application'
end
