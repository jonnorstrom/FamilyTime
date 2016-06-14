require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, params: { topic_id: @topic }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { topic_id: @topic }
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { topic_id: @topic, comment: @comment.attributes }
    end

    assert_redirected_to topic_comment_path(@topic, Comment.last)
  end

  test "should show comment" do
    get :show, params: { topic_id: @topic, id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { topic_id: @topic, id: @comment }
    assert_response :success
  end

  test "should update comment" do
    put :update, params: { topic_id: @topic, id: @comment, comment: @comment.attributes }
    assert_redirected_to topic_comment_path(@topic, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { topic_id: @topic, id: @comment }
    end

    assert_redirected_to topic_comments_path(@topic)
  end
end
