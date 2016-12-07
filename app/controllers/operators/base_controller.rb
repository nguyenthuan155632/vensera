class Operators::BaseController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

	layout 'operators/layouts/application'

end
