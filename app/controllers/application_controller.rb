class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # all these function are available in all controllers but not views by default
  helper_method :current_user, :logged_in? # to be available in views
  def current_user
    @current_user  ||= User.find(session[:user_id]) if session[:user_id] #return the user 
  end

  def logged_in?
    !!current_user #return true if current_user
  end

  def require_user
    if !logged_in?
      flash[:danger]= "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
