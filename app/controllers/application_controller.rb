class ApplicationController < ActionController::Base
before_action :configure_permitted_parametars, if: :devise_controller?

	protected
	def configure_permitted_parametars
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end
	def after_sign_in_path_for(resorce)
		user_path(current_user.id)
	end

end
