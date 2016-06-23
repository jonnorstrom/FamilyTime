class CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET topics/1/comments
  def index
    @comments = @topic.comments
  end

  # GET topics/1/comments/1
  def show
  end

  # GET topics/1/comments/new
  def new
    @comment = @topic.comments.build
  end

  # GET topics/1/comments/1/edit
  def edit
  end

  # POST topics/1/comments
  def create
    @comment = @topic.comments.build(comment_params)
    @comment.update(user_id: params[:user_id])

    if @comment.save
      redirect_to([current_vacation, current_topic], notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT topics/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to([@vacation, @topic], notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE topics/1/comments/1
  def destroy
    @comment.destroy

    redirect_to vacation_topic_path(current_vacation, current_topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_comment
      @comment = @topic.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
