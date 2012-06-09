class AdminSessionsController < ApplicationController
  # GET /admin_sessions
  # GET /admin_sessions.js
  def new
    @admin_session = AdminSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_session }
    end
  end


  # POST /admin_sessions
  # POST /admin_sessions.json
  def create
    @admin_session = AdminSession.new(params[:admin_session])

    respond_to do |format|
      if @admin_session.save
        format.html { redirect_to @admin_session, notice: 'Admin session was successfully created.' }
        format.json { render json: @admin_session, status: :created, location: @admin_session }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_session = AdminSession.find
    @admin_session.destroy

    respond_to do |format|
      format.html { redirect_to :login }
      format.json { head :ok }
    end
  end
end
