require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	
	test "return false" do
		@user.authentication(username,password)
		assert_not  false
	end

	def test_authenticate
		user = User.new
		username = "kim"
		password = "scott"
		@test = User.authenticate(username,password)
		assert_not(@test,"wow") 
	end
end
