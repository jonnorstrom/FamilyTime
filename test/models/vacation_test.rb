require 'test_helper'

class VacationTest < ActiveSupport::TestCase
  setup do
    @vacation = Vacation.create(name: "Test Vacation")
  end

  test "makes new vacation topics on create" do
    assert_equal(@vacation.topics.count, 3)
  end

  test "doesn't make new topics on any update" do
    @vacation.update(name: "New Name", start: Date.today)
    assert_equal(@vacation.topics.count, 3)
  end

  test "doesn't make meals when dates aren't present" do
    assert_empty(@vacation.meals)
  end

  class VacationTest <ActiveSupport::TestCase
    setup do
      @vacation = Vacation.create(name: "Test Vacation")
      @vacation.update(start: Date.new(2016,4,12), end: Date.new(2016,4,20))
    end

    test "makes meals when dates are present" do
      assert_not_empty(@vacation.meals)
    end

    test "makes the corrent amount of meals" do
      assert(@vacation.meals.first.day = Date.new(2016,4,12) && @vacation.meals.last.day = Date.new(2016,4,20))
    end

    test "it changes meals when the vacation dates change" do
      @vacation.update(start: Date.new(2016,4,24), end: Date.new(2016,5,9))
      assert(@vacation.meals.first.day = Date.new(2016,4,12) && @vacation.meals.last.day = Date.new(2016,4,20))
    end
  end
end
