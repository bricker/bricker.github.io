class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?
  def logged_in?
    cookies[:auth_token]
  end
  
  def require_login
  	return true if logged_in?
  	session[:return_to] = request.fullpath
  	redirect_to root_path, alert: "The requested page has restricted access." and return false
  end
end
