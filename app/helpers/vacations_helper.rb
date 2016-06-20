module VacationsHelper
  def make_vacation_topics(vacation)
    make_new(vacation, "Where/When", "Where all general coordination planning happens")
    make_new(vacation, "Food/Meals", "Where planning of who's making what and when")
    make_new(vacation, "Rooming", "Where figuring out rooming arrangements can happen")
  end

  def make_vacation_meals(vacation)
    unless !vacation.start || !vacation.end
      if vacation.meals.empty? || different_dates(vacation)
        set_meal_dates(vacation)
      end
    end
  end

  def form_is_closed(name)
    !@vacation.topics.where(name: name)[0].is_open
  end

  def meal_form?
    Topic.find(params[:id]).name == 'Food/Meals'
  end

  private

  def different_dates(vacation)
    vacation.start != vacation.meals.first || vacation.end != vacation.meals.last
  end

  def make_new(vacation, name, description)
    vacation.topics.create(name: name, description: description)
  end

  def set_meal_dates(vacation)
    vacation.meals.destroy_all
    length = ((vacation.end - vacation.start).to_i) + 1
    counter = 0
    length.times do
      vacation.meals.create(day: vacation.start+(counter))
      counter +=1
    end
  end
end
