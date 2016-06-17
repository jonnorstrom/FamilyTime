module ApplicationHelper
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def logout_user
    session.delete(:current_user_id)
  end

  def login_user(params)
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:current_user_id] = user.id
      @notice = "Logged in Successfully"
    else
      @notice = "Wrong Email or Password"
    end
  end
end
