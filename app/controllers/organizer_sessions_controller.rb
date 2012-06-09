class OrganizerSessionsController < ApplicationController
  # GET /organizer_sessions
  # GET /organizer_sessions.json
  def new
    @organizer_session = OrganizerSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organizer_session }
    end
  end

  
  # POST /organizer_sessions
  # POST /organizer_sessions.json
  def create
    @organizer_session = OrganizerSession.new(params[:organizer_session])

    respond_to do |format|
      if @organizer_session.save
        format.html { redirect_to @organizer_session, notice: 'Organizer session was successfully created.' }
        format.json { render json: @organizer_session, status: :created, location: @organizer_session }
      else
        format.html { render action: "new" }
        format.json { render json: @organizer_session.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /organizer_sessions/1
  # DELETE /organizer_sessions/1.json
  def destroy
    @organizer_session = OrganizerSession.find
    @organizer_session.destroy

    respond_to do |format|
      format.html { redirect_to organizer_sessions_url }
      format.json { head :ok }
    end
  end
end
