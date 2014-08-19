require 'test_helper'

class VideoshopsControllerTest < ActionController::TestCase
  setup do
    @videoshop = videoshops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videoshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create videoshop" do
    assert_difference('Videoshop.count') do
      post :create, videoshop: { name: @videoshop.name, prerollads: @videoshop.prerollads, videoid: @videoshop.videoid, views: @videoshop.views }
    end

    assert_redirected_to videoshop_path(assigns(:videoshop))
  end

  test "should show videoshop" do
    get :show, id: @videoshop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @videoshop
    assert_response :success
  end

  test "should update videoshop" do
    patch :update, id: @videoshop, videoshop: { name: @videoshop.name, prerollads: @videoshop.prerollads, videoid: @videoshop.videoid, views: @videoshop.views }
    assert_redirected_to videoshop_path(assigns(:videoshop))
  end

  test "should destroy videoshop" do
    assert_difference('Videoshop.count', -1) do
      delete :destroy, id: @videoshop
    end

    assert_redirected_to videoshops_path
  end
end
