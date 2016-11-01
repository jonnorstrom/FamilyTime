class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:update]

  # POST vacations/1/attractions
  def create
    @attraction = @vacation.attractions.build(attraction_params)

    if @attraction.save
      if request.xhr?
        render :json => {:html => (render_to_string partial: 'attraction.html.erb', :locals => {attraction: @attraction})}
        # render_to_string(:partial => 'partial_file.html', :locals => {:variable => variable}, :format => :html)
      else
        redirect_to(@vacation)
      end
    else
      render action: 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      if Attraction.find_by(id: params[:id])
        @attraction = @vacation.attractions.find(params[:id])
      else
        return nil
      end
    end

    # Only allow a trusted parameter "white list" through.
    def attraction_params
      params.require(:attraction).permit(:name, :weblink, :location)
    end
end
