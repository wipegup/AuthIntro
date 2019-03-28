class UsersController < ApplicationController
  before_action :require_login, only: [:secret]

  def new
    @user = User.new
  end

  def create
    if User.where(email: user_info[:email]).count >0
      redirect_to user_error_path
    else

      @user= User.new(user_info)
      @user.save

      redirect_to root_path
    end
  end

  def require_login
    unless session[:current_user_id] != nil
      flash[:error] = "must be logged in"
      redirect_to root_path
    end
  end

  def error

  end

  def secret

  end

  private

  def user_info
    params.require(:user).permit(:full_name, :email, :password)
  end
end
