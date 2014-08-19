class Transactions < ActiveRecord::Base
		def self.update_skip(status,sessionid)	
		@skipad = Transactions.where("id =?", sessionid).select("*").first
		if @skipad
			return @skipad.update(:skip_ad => true)
		end
		return false
	end
end
