class WelcomeController < ApplicationController
  def index
    @current_user = session[:current_user_id]
  end
end
