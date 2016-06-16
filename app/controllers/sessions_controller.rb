class SessionsController < ApplicationController
  def new
    login_user(params)
    redirect_to root_path
  end

  def destroy
    logout_user
    redirect_to root_path
  end
end
