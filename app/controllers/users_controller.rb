class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  skip_before_action :set_vacation, only: [:edit, :update]

  # GET /users/1/edit
  def edit
  end

  def update
    if @user.authenticate(params[:user][:old_password])
      @user.update_password(params[:user][:password])
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest)
    end
end
