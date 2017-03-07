class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:new, :create, :show, :update]
  before_action :set_meeting, only: [:create, :update]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @task.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to meeting_task_path(@meeting, @task), notice: 'Comment was successfully created.'
    else
      redirect_to meeting_task_path(@meeting, @task)
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to meeting_task_path(@meeting, @task), notice: 'Comment was successfully edited.'
    else
      render :edit
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to meeting_task_comments_path, notice: 'Comment was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_meeting
      @meeting = Meeting.find(params[:meeting_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
