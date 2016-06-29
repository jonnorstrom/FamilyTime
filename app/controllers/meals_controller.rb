class MealsController < ApplicationController

  def update
    @meal = Meal.find(params[:meal][:meal_id])
    @meal.update(user_id: params[:meal][:user_id])

    if @meal.save
      if request.xhr?
        render :json => {:html => (render_to_string partial: 'accounted_for.html.erb', :locals => {meal: @meal})}
        # render_to_string(:partial => 'partial_file.html', :locals => {:variable => variable}, :format => :html)
      else
        redirect_to(@vacation)
      end
    else
      render action: 'new'
    end
  end

  private
    def meal_params
      params.require(:meal).permit(:day, :user_id)
    end
end
