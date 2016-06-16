module ApplicationHelper
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def logout_user
    session.delete(:current_user_id)
  end

  def login_user(params)
    id = User.find_by(email: params[:email]).id
    session[:current_user_id] = id
  end
end
