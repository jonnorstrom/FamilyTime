class Vacation < ActiveRecord::Base
  has_many :photos
  has_many :meals, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :attractions, dependent: :destroy
  has_many :invitations
  has_many :users, through: :invitations

  after_create :make_vacation_topics
  after_update :make_vacation_meals

  def make_vacation_topics
    make_new("Where/When", "Where all general coordination planning happens")
    make_new("Food/Meals", "Where planning of who's making what and when")
    make_new("Rooming", "Where figuring out rooming arrangements can happen")
  end

  def make_vacation_meals
    if ready_to_add_meals?
      if meals_unaccounted_for?
        set_meal_dates
      end
    end
  end

  private

  def ready_to_add_meals?
    start && self.end
  end

  def make_new(name, description)
    topics.create(name: name, description: description)
  end

  def meals_unaccounted_for?
    meals.empty? || different_dates
  end

  def different_dates
    start != meals.first || self.end != meals.last
  end

  def set_meal_dates
    meals.destroy_all
    length = ((self.end - start).to_i) + 1
    counter = 0
    length.times do
      meals.create(day: start+(counter))
      counter +=1
    end
  end
end
