class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new]
  def new
    login_user(params)
    redirect_to root_path, notice: @notice
  end

  def destroy
    logout_user
    redirect_to root_path
  end
end
