require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  include VacationsHelper
  setup do
    @user = users(:one)
    @vacation = vacations(:one)
    @topic = topics(:one)
  end

  test "should get index" do
    get(:index, { vacation_id: @vacation }, { :current_user_id => @user.id })
    assert_response :success
  end

  test "should show topic" do
    @topic.update(vacation_id: @vacation.id)
    get(:show, { vacation_id: @vacation, id: @topic }, { :current_user_id => @user.id })
    assert_response :success
  end
end
