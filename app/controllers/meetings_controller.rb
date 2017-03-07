class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :join]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /meetings
  # GET /meetings.json
  def index
    if params[:search]
      @meetings = Meeting.search(params[:search]).order("created_at DESC")
    else
      @meetings = Meeting.all.order("created_at DESC")
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    if user_owns_meeting
      render :edit
    else
      flash[:notice] = 'You are not authorized to use this feature'
      redirect_to @meeting
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @user = current_user
    @meeting = @user.meetings.new(meeting_params)
    @meeting.user_id = current_user.id
    if @meeting.save
      redirect_to @meeting, notice: 'Meeting was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: 'Meeting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    redirect_to meetings_url, notice: 'Meeting was successfully deleted.'
  end

  def join
    @meeting.users << current_user
    #current_user.meetings << @meeting
    flash[:notice] = "You have successfully joined this event!"
    redirect_to profile_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:starts_on, :name, :location)
    end

    def user_owns_meeting
      @meeting.user_id == current_user.id
    end
end
