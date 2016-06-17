module VacationsHelper
  def make_vacation_topics(vacation)
    make_new(vacation, "Where/When", "Where all general coordination planning happens")
    make_new(vacation, "Food/Meals", "Where planning of who's making what and when")
    make_new(vacation, "Rooming", "Where figuring out rooming arrangements can happen")
  end

  private

  def make_new(vacation, name, description)
    vacation.topics.create(name: name, description: description)
  end
end
