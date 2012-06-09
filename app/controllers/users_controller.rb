class UsersController < ApplicationController

  # GET /users
  # GET /users.json
   def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit

    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        
    
    return false
  end

  @user = User.find(params[:id])
  @log=ActivityLog.new
    @log.username=current_user.username
    @log.activity="edited his/her"
    @log.details="profile"
    @log.time="During "+Time.now.to_s
    @log.save  
end

  # POST /users
  # POST /users.json
 def create
    @user = User.new(params[:user])

    respond_to do |format|
      @user.almonds=0
      if @user.save
        format.html { redirect_to(home_home_path, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        
    
    return false
  end
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        
    
    return false
  end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
