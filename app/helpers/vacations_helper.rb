module VacationsHelper
  def form_is_closed(name)
    !@vacation.topics.where(name: name)[0].is_open
  end

  def is_meals?
    Topic.find(session[:topic_id]).name == 'Food/Meals'
  end

  def is_rooming
    Topic.find(session[:topic_id]).name == 'Rooming'
  end

  def is_where_when?
    Topic.find(session[:topic_id]).name == 'Where/When'
  end
end
