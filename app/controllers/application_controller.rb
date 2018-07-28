class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.html {redirect_to root_url, alert: 'No tienes autorización para realizar esta acción'}
		end
	end
end
