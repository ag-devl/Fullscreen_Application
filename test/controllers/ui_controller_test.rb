require 'test_helper'

class UiControllerTest < ActionController::TestCase
  test "should get watch" do
    get :index
    assert_response :success
    assert_not_nil assigns(:name)
  end

end
