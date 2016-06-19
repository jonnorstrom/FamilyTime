class SplashController < ApplicationController
  skip_before_action :require_login, only: [:index]
  skip_before_action :set_vacation, only: [:index]
  def index
    @user = User.new
    redirect_to vacations_path unless !current_user
  end
end
