class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new]
  skip_before_action :set_vacation

  def new
    if !login_user(params[:user])
      redirect_to edit_user_path(User.find(session[:current_user_id]))
    else
      redirect_to root_path, notice: @notice
    end
  end

  def destroy
    logout_user
    redirect_to root_path
  end
end
