class Operators::BaseController < ActionController::Base
	protect_from_forgery with: :exception

	layout 'operators/layouts/application'
end
