class SplashController < ApplicationController
  def index
    @user = User.new
    redirect_to vacations_path unless !current_user
  end
end
