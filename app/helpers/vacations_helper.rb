module VacationsHelper
  def form_is_closed(name)
    !@vacation.topics.where(name: name)[0].is_open
  end

  def meal_form?
    Topic.find(params[:id]).name == 'Food/Meals'
  end
end
