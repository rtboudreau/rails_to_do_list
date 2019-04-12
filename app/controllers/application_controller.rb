class ApplicationController < ActionController::Base
 helper_method :logged_in?
  helper_method :current_user
  add_flash_types :success, :warning, :danger, :info

 before_action :authenticate_user


 def current_user
   User.find_by(id: session[:user_id])
 end

 def logged_in?
    !current_user.nil?
 end

  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
