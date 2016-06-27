module ApplicationHelper
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def current_vacation
    @vacation ||= Vacation.find(params[:vacation_id])
    @vacation ||= Vacation.find(params[:id])
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
      @notice = "Logged in Successfully"
    else
      @notice = "Wrong Email or Password"
    end
  end

  def ordered_resource(resource)
    resource.order(:id)
  end

  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end
end
