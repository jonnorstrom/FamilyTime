require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  setup do
    @vacation = vacations(:one)
    @attraction = attractions(:one)
  end

  test "should get index" do
    get :index, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post :create, params: { vacation_id: @vacation, attraction: @attraction.attributes }
    end

    assert_redirected_to vacation_attraction_path(@vacation, Attraction.last)
  end

  test "should show attraction" do
    get :show, params: { vacation_id: @vacation, id: @attraction }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { vacation_id: @vacation, id: @attraction }
    assert_response :success
  end

  test "should update attraction" do
    put :update, params: { vacation_id: @vacation, id: @attraction, attraction: @attraction.attributes }
    assert_redirected_to vacation_attraction_path(@vacation, Attraction.last)
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete :destroy, params: { vacation_id: @vacation, id: @attraction }
    end

    assert_redirected_to vacation_attractions_path(@vacation)
  end
end
