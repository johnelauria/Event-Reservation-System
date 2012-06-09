class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  
  def index
    @events = Event.all
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    @event = Event.find(params[:id])
    @log=ActivityLog.new
    @log.username=current_user.username
    @log.activity="edited an"
    @log.details="event"
    @log.details2="called "+@event.title.to_s
    @log.time="During "+Time.now.to_s
    @log.save
  end

  # POST /events
  # POST /events.json
  def create
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    @event = Event.new(params[:event])
    

    respond_to do |format|
    @event.attending=0
    @event.reserved=0
      @log=ActivityLog.new
    @log.username=current_user.username
    @log.activity="created an"
    @log.details="event"
    @log.details2="called "+params[:event][:title].to_s
    @log.time="During "+Time.now.to_s
    @log.save
      @event.user_id = current_user.id
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @notice=Notice.new
    @notice.note="Admin Has Deleted your Event : " +@event.title.to_s+" For Being inappropriate, This was done During "+Time.now.to_s
    @notice.user_id =@event.user_id
    @notice.save
    @event.destroy

    respond_to do |format|
      format.html { redirect_to adminhome_events_path }
      format.json { head :ok }
    end
  end
end
