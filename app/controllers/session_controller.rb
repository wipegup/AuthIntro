class SessionController < ApplicationController
  def enter_info
    @user = User.new
  end

  def login
    session[:current_user_id] = User.authenticate(params[:user][:email], params[:user][:password])
    redirect_to root_path
  end

  def logoff
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
