class UiController < ApplicationController

	def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end



	def mainPage 
		@lists = Videoshop.all
	end

	def watch 
	  @videoId = params[:videoID]

    @videoshop = Videoshop.find(@videoId)
    name = @videoshop.name
    id = @videoshop.id
    x = @videoshop.views
    vw = Videoshop.update(id, :views => x+1)
    vw.save

    @trans = Transactions.create(:videoid => @videoID,  )
  end 

  def like
  	@trans = Videoshop.find(:like)

  end

  def onclick

  end


end
