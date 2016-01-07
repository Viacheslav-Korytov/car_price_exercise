class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
private
  def set_organization
	@organization = Organization.first
  end
  
  def authenticate
	authenticate_or_request_with_http_basic do |id, password|
		user = User.where(name: id).first
		if user && user.password == password
			@current_user = user
			@organization = user.organization
			true
		else
			false
		end
	end
  end
  
end
