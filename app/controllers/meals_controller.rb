class MealsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def update
    @meal = Meal.find(params[:meal][:meal_id])
    @meal.update(user_id: params[:meal][:user_id])

    if @meal.save
      redirect_to([@topic.vacation, @topic], notice: 'Meal was successfully updated.')
    else
      render action: 'new'
    end
  end

  private

    def set_topic
      @topic = @vacation.topics.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:day, :user_id)
    end
end
