class SplashController < ApplicationController
  def index
    session[:current_user_id] = 1
  end
end
