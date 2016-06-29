class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_vacation

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access that section"
      redirect_to root_path # halts request cycle
    end
  end

  def set_vacation
    @vacation = Vacation.find(params[:vacation_id])
  end
end
