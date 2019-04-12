class UsersController < ApplicationController
  
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(session[:user_id])
    else
      flash[:messages] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def index
    @users=User.all
  end

  def show
    @user=User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
