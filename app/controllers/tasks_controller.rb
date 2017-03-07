class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_meeting, only: [:new, :create, :index, :update, :show, :destroy]

  # GET /agenda_items
  # GET /agenda_items.json
  def index
    @tasks = @meeting.tasks
  end

  # GET /agenda_items/1
  # GET /agenda_items/1.json
  def show
    @comment = @task.comments.new
  end

  # GET /agenda_items/new
  def new
    @task = @meeting.tasks.new
  end

  # GET /agenda_items/1/edit
  def edit
    @meeting = Meeting.find(params[:meeting_id])
  end

  # POST /agenda_items
  # POST /agenda_items.json
  def create
    @task = @meeting.tasks.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to meeting_task_path(@meeting, @task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /agenda_items/1
  # PATCH/PUT /agenda_items/1.json
  def update
    if @task.update(task_params)
      redirect_to meeting_task_path(@meeting, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /agenda_items/1
  # DELETE /agenda_items/1.json
  def destroy
    @task.destroy
    redirect_to meeting_task_path(@meeting, @task), notice: 'Task was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_meeting
      @meeting = Meeting.find(params[:meeting_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title)
    end
end
