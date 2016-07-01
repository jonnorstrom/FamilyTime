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
    if request.xhr?
      render :json => {:html => (render_to_string partial: 'topics/edit_comment_form', :locals => {comment: @comment})}
    else
      redirect_to([@vacation, @topic], notice: 'Comment was successfully updated.')
    end
  end

  # POST topics/1/comments
  def create
    @comment = @topic.comments.build(comment_params)
    @comment.update(user_id: params[:user_id])

    if @comment.save
      redirect_to(current_vacation)
    else
      redirect_to(current_vacation, notice: "Comment wan't successfully made :(")
    end
  end

  # PUT topics/1/comments/1
  def update
    p params
    if @comment.update_attributes(comment_params)
      if request.xhr?
        render :json => {:html => (render_to_string partial: 'topics/single_comment_js', :locals => {comment: @comment})}
      else
        redirect_to(current_vacation)
      end
    else
      render action: 'edit'
    end
  end

  # DELETE topics/1/comments/1
  def destroy
    @comment.destroy
    redirect_to(current_vacation)
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
