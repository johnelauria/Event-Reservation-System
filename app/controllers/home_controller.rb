class HomeController < ApplicationController
	before_filter :require_user
 def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
  def home
  	  	@user=User.find(current_user.id)
  	@events=@user.events
    @cevent=Event.where("user_id = ?",@user)
    @eventscount=Event.count
    @featuredevents=Event.limit(4).offset(@eventscount-2)
    @recentevents=Event.where("reserved > 0").limit(4)

@notes=Notice.where("user_id =?",@user.id)
  end
  def view
  	@user=User.find(current_user.id)
  	
  	   @sasd=Event.find(params[:q])
    @log=ActivityLog.new
    @log.username=@user.username
    @log.activity="viewed an"
    @log.details="event"
    @log.details2="called "+@sasd.title.to_s
    @log.time="During "+Time.now.to_s
    @log.save



  end
  def selection
  	@events=Event.all
  end
  def add



  	@user=User.find(current_user.id)
  	@sasd=Event.find(params[:q])


    if @user.almonds == 0

      respond_to do |format|
      
      format.html { redirect_to home_selection_path, notice: 'You Have 0 balance.' }
    end
    
    else
      if @user.almonds < @sasd.price
      respond_to do |format|
      
      format.html { redirect_to home_selection_path, notice: 'Insufficient CC balance.' }
    end
      else
        if @sasd.attending == @sasd.capacity
      respond_to do |format|
      
      format.html { redirect_to home_selection_path, notice: 'You can no longer Attend The Event, The Event Has Reached Its Maximum Capacity.' }
    end
      else
       @new= @user.almonds.to_i-@sasd.price.to_i 
       @user.almonds=@new
       @user.save
  	@userevents=Userevent.create
  	@user.userevents <<@userevents
  	@sasd.userevents <<@userevents
    @sasd.attending+=1
    @sasd.save
  	@userevents.save

    @log=ActivityLog.new
    @log.username=@user.username
    @log.activity="attended an"
    @log.details="event"
    @log.details2="called "+@sasd.title.to_s
    @log.time="During "+Time.now.to_s
    @log.save
  	respond_to do |format|
  		
  		format.html { redirect_to home_manage_path, notice: 'Event was successfully attended.' }
end
end
  end
end
end
def manage
@user=User.find(current_user.id)
@events=Event.where("user_id = ?",@user)
@attendevents=Userevent.where("user_id= ?",@user.id)
@notes=Notice.where("user_id =?",@user.id)
end
def almonds
  @user=User.find(current_user.id)
end

def buy
  
  respond_to do |format|
    @user=User.find(current_user.id)
  @user.almonds += params[:dugas].to_i
  @user.save

    @log=ActivityLog.new
    @log.username=@user.username
    @log.activity="purchased"
    @log.details="Choco Chips"
    @log.details2="Worth "+params[:dugas].to_s
    @log.time="During "+Time.now.to_s
    @log.save
      format.html { redirect_to home_almonds_path }
      end
end

def print
  @event=Event.find(params[:q])
end

end
