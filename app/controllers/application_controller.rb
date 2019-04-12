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


rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from Exception, with: :not_found
rescue_from ActionController::RoutingError, with: :not_found

def raise_not_found
  raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
end

def not_found
  respond_to do |format|
    format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
    format.xml { head :not_found }
    format.any { head :not_found }
  end
end

def error
  respond_to do |format|
    format.html { render file: "#{Rails.root}/public/500", layout: false, status: :error }
    format.xml { head :not_found }
    format.any { head :not_found }
  end
end

end
