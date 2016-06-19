class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # POST vacations/1/topics
  def create
    @meal = @vacation.build(meal_params)
    @meal.update(user_id: params[:user_id])

    if @meal.save
      redirect_to([@topic.vacation, @topic], notice: 'Meal was successfully created.')
    else
      render action: 'new'
    end
  end

  private

    def meal_params
      params.require(:meal).permit(:day, :user_id)
    end


end
