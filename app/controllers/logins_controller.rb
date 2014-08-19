class LoginsController < ApplicationController
 skip_before_filter :verify_authenticity_token, :only => :create
  
  def create
    @lists = Videoshop.all

    if !session[:current_user_id] && params[:username] 
      
  	 @user = User.authenticate(params[:username], params[:password])
        if @user == false
          return false
        else
          session[:current_user_id] = @user.id
          session[:name] = @user.name
        end
    end
     
  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end


	def watch 
	  
    @videoId = params[:videoID]

    @videoshop = Videoshop.find(@videoId)
    name = @videoshop.name
    id = @videoshop.id
    session[:videoid] = id

    x = @videoshop.views
    vw = Videoshop.update(id, :views => x+1)
    vw.save

    @trans = Transactions.create(:videoid => id,:userid => session[:current_user_id], :skip_ad => false)

    session[:transaction_id] = @trans.id
    
    
  end 

  def action 
	   @status = params[:status]
     @session_id = session[:transaction_id]
      if @status == "skip"
      @skip = Transactions.update_skip(@status, @session_id)        
      else
	      @rval = Preference.update_record(session[:current_user_id],session[:videoid],@status)
      end
  end
end
