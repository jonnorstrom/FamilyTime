class SplashController < ApplicationController
  def index
    # session[:current_user_id] = 2
    if !current_user
      render :index
    else
      redirect_to vacations_path
    end
  end
end
