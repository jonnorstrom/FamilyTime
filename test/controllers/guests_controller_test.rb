require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @vacation = vacations(:one)
    @guest = guests(:one)
  end

  test "should get index" do
    get :index, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, params: { vacation_id: @vacation, guest: @guest.attributes }
    end

    assert_redirected_to vacation_guest_path(@vacation, Guest.last)
  end

  test "should show guest" do
    get :show, params: { vacation_id: @vacation, id: @guest }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { vacation_id: @vacation, id: @guest }
    assert_response :success
  end

  test "should update guest" do
    put :update, params: { vacation_id: @vacation, id: @guest, guest: @guest.attributes }
    assert_redirected_to vacation_guest_path(@vacation, Guest.last)
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, params: { vacation_id: @vacation, id: @guest }
    end

    assert_redirected_to vacation_guests_path(@vacation)
  end
end
