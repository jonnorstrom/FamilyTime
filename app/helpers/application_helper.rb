module ApplicationHelper
  include VacationsHelper
  include CommentsHelper
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def current_vacation
    @vacation ||= (Vacation.find(params[:vacation_id]) || Vacation.find(params[:id]))
  end

  def current_topic
    @topic ||= Topic.find(params[:topic_id])
  end


  def logout_user
    session.delete(:current_user_id)
  end

  def login_user(params)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      return false if need_to_reset_password(user)
      return @notice = "Logged in Successfully"
    else
      return @notice = "Wrong Email or Password"
    end
    return false
  end

  def ordered_resource(resource)
    resource.order(:id)
  end

  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def need_to_reset_password(user)
    user.authenticate('password') ? true : false
  end

end
