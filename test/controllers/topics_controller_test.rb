require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @vacation = vacations(:one)
    @topic = topics(:one)
  end

  test "should get index" do
    get :index, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, params: { vacation_id: @vacation, topic: @topic.attributes }
    end

    assert_redirected_to vacation_topic_path(@vacation, Topic.last)
  end

  test "should show topic" do
    get :show, params: { vacation_id: @vacation, id: @topic }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { vacation_id: @vacation, id: @topic }
    assert_response :success
  end

  test "should update topic" do
    put :update, params: { vacation_id: @vacation, id: @topic, topic: @topic.attributes }
    assert_redirected_to vacation_topic_path(@vacation, Topic.last)
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, params: { vacation_id: @vacation, id: @topic }
    end

    assert_redirected_to vacation_topics_path(@vacation)
  end
end
