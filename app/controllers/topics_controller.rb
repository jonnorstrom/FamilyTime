class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET vacations/1/topics
  def index
    @topics = @vacation.topics
  end

  # GET vacations/1/topics/1
  def show
    ## because new comment form is on this page
    @comment = Comment.new
    @meal = Meal.new
    session[:topic_id] = params[:id]
    respond_to do |format|
      format.json { render :json => {:success => true, :html => (render_to_string partial: 'all_comments_js.html.erb')}
       }
       format.html { render :show }
    end
  end

  # GET vacations/1/topics/new
  def new
    @topic = @vacation.topics.build
  end

  # GET vacations/1/topics/1/edit
  def edit
  end

  # POST vacations/1/topics
  def create
    @topic = @vacation.topics.build(topic_params)

    if @topic.save
      redirect_to([@topic.vacation, @topic], notice: 'Topic was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT vacations/1/topics/1
  def update
    p "here!"
    if @topic.update_attributes(topic_params)
      if request.xhr?
        render json: {updated: true}
      else
        redirect_to([@topic.vacation, @topic], notice: 'Topic was successfully updated.')
      end
    else
      render action: 'edit'
    end
  end

  # DELETE vacations/1/topics/1
  def destroy
    @topic.destroy

    redirect_to vacation_topics_url(@vacation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_topic
      @topic = @vacation.topics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:description, :name, :is_open)
    end
end
