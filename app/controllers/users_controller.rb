class UsersController < ApplicationController
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

  def error

  end

  private

  def user_info
    params.require(:user).permit(:full_name, :email, :password)
  end
end
