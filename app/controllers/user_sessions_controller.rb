class UserSessionsController < ApplicationController

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|


      if Admin.find_by_username(params[:user_session][:username])
        @admin_session = AdminSession.new(params[:user_session])
      if @admin_session.save
        format.html { redirect_to(adminhome_home_path) }
        format.json { render json: @admin_session, status: :created, location: @admin_session }
      else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
      end
      else
    if User.find_by_username(params[:user_session][:username])
        @user_session = UserSession.new(params[:user_session])    
     if @user_session.save
        format.html { redirect_to(home_home_path, :notice => 'Login Successful') }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end
end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(:login, :notice => 'Goodbye!') }
      format.xml  { head :ok }
    end
  end
end
