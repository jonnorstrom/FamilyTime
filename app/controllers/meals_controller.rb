class MealsController < ApplicationController

  def update
    @meal = Meal.find(params[:meal][:meal_id])
    @meal.update(user_id: params[:meal][:user_id])

    if @meal.save
      redirect_to(@vacation, notice: 'Meal was successfully updated.')
    else
      render action: 'new'
    end
  end

  private
    def meal_params
      params.require(:meal).permit(:day, :user_id)
    end
end
