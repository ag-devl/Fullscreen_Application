class User < ActiveRecord::Base
	
	def self.authenticate(username, password)
		@user = User.find_by name: username
 	 	if @user && @user.password == password
    	return @user
  		else
    		return false
  		end
	end 
end
