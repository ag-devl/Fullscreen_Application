class Preference < ActiveRecord::Base
	def user_params
		params.require(:userid).permit(:videid,:likes,:dislikes)
	end

	def self.update_record(userid,videoid,status)
		@pref = Preference.where("userid = ? AND videoid = ?", userid, videoid).select("*").first
		if @pref
			if status == "like"
				return @pref.update_attributes(:likes => true, :dislikes => false)
			elsif status == "dislike"
				return @pref.update_attributes(:likes => false, :dislikes => true)
			else
				return false
			end
		else
			if status == "like"
				return Preference.create(:videoid => videoid , :userid => userid , :likes => true, :dislikes => false)
			elsif status == "dislike"
				return Preference.create(:videoid => videoid , :userid => userid , :likes => false, :dislikes => true)
			else
				return false
			end
		end
		return false
	end


	def self.statistics
		@maxlikes = Preference.connection.execute("SELECT max(my_count) as maxcount FROM (SELECT p.videoid,count(*) as my_count FROM preferences p where likes = true group by videoid) X")
		return @maxlikes.getvalue(0,0)
	end

end
