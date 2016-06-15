require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @vacation = vacations(:one)
    @photo = photos(:one)
  end

  test "should get index" do
    get :index, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { vacation_id: @vacation }
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, params: { vacation_id: @vacation, photo: @photo.attributes }
    end

    assert_redirected_to vacation_photo_path(@vacation, Photo.last)
  end

  test "should show photo" do
    get :show, params: { vacation_id: @vacation, id: @photo }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { vacation_id: @vacation, id: @photo }
    assert_response :success
  end

  test "should update photo" do
    put :update, params: { vacation_id: @vacation, id: @photo, photo: @photo.attributes }
    assert_redirected_to vacation_photo_path(@vacation, Photo.last)
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, params: { vacation_id: @vacation, id: @photo }
    end

    assert_redirected_to vacation_photos_path(@vacation)
  end
end
