
class AdminhomeController < ApplicationController
  before_filter :require_user
 def require_user
      unless current_admin
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
  def home
  end
  def users
  	if params[:dugas]=="yes"
  	@user=User.find_by_username(params[:user])
  	@userevents=Event.where("user_id = ?",@user.id)
    @userattending=Userevent.where("user_id =?",@user.id)
    @type="User : "+@user.username
    @logs=ActivityLog.where("username =?",@user.username)
 	  else
 	    if params[:dugas]=="yeah"
 		   @users=User.all

       @type="Users : All"
 	    else
        @type="Users "
      end
    end


  end
  def events
  	if params[:dugas]=="yes"
  	@event=Event.find_by_title(params[:event])
    @user=User.find(@event.user_id)
 	  end
 	  if params[:dugas]=="yeah"
 		@events=Event.all
 	  end
    if params[:dugas2]=="event"
    @event=Event.find(params[:eventid])
    
    @user=User.find(@event.user_id)
    end

  end

  def activity_logs
    @logs=ActivityLog.all

  end
  def chocochip
    if params[:dugas]=="none"
      
      @users=User.where("almonds != 0").order("almonds DESC").limit(5)

    end

    if params[:dugas]=="all"
      
      @users=User.where("almonds != 0")
        
    end
    if params[:dugas]=="logs"
      @logs=ActivityLog.where("activity =?","Choco Chips")
    end

  end




def print
  if params[:type]=="event"
    @event=Event.find(params[:event])
    @user=User.find(params[:user])
  end

  if params[:type]=="usercreatedevents"    
    @user=User.find_by_username(params[:user])
    @userevents=Event.where("user_id = ?",@user.id)
    @type="User : "+@user.username
  end
  if params[:type]=="userlog"    
    @user=User.find_by_username(params[:user])
    @type="User : "+@user.username
    @logs=ActivityLog.where("username =?",@user.username)
  end
  if params[:type]=="userprofile"    
    @user=User.find_by_username(params[:user])
    @type="User : "+@user.username
  end
  if params[:type]=="allevents"    
    @events=Event.all
  end
  if params[:type]=="alllogs"    
    @logs=ActivityLog.all
  end
  if params[:type]=="userattending"
    
    @user=User.find_by_username(params[:user])
    @type="User : "+@user.username
    @userattending=Userevent.where("user_id =?",@user.id)
end
if params[:type]=="allusers"
@users=User.all
end

if params[:type]=="cc5"
 @users=User.where("almonds != 0").order("almonds DESC").limit(5)
end

if params[:type]=="allcc"
      
      @users=User.where("almonds != 0")
        
    end

end
  
end
