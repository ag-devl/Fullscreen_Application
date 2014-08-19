require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  def test_destroy
  	assert_nil(session[:current_user_id],"WOW")
  end
end
