require 'test_helper'

class VacationsControllerTest < ActionController::TestCase
  include ApplicationHelper
  include VacationsHelper

  setup do
    @user = users(:one)
    @vacation = vacations(:one)
  end

  test "should get index" do
    get :index, {}, {:current_user_id => @user.id}
    assert_response :success
    assert_not_nil assigns(:vacations)
  end

  test "should get new" do
    get :new, {}, {:current_user_id => @user.id}
    assert_response :success
  end

  test "should create vacation" do
    assert_difference('Vacation.count') do
      post :create, {vacation: {name: "Test Vaca"}}, :current_user_id => @user.id
    end

    assert_redirected_to vacation_path(assigns(:vacation))
  end

  test "should show vacation" do
    make_vacation_topics(@vacation)
    get(:show, {id: @vacation}, {:current_user_id => @user.id})
    assert_response :success
  end

  test "should get edit" do
    get(:edit, {id: @vacation}, {:current_user_id => @user.id})
    assert_response :success
  end

  test "should update vacation" do
    put(:update, {id: @vacation, vacation: {name: "test vaca"}}, {:current_user_id => @user.id})
    assert_redirected_to vacation_path(assigns(:vacation))
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete(:destroy, {id: @vacation}, {:current_user_id => @user.id})
    end

    assert_redirected_to vacations_path
  end
end


# {vacation: {id: @vacation, name: "Testing Vacation"}
