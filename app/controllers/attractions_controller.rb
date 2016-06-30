class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET vacations/1/attractions
  def index
    @attractions = @vacation.attractions
  end

  # GET vacations/1/attractions/1
  def show
  end

  # GET vacations/1/attractions/new
  def new
    @attraction = @vacation.attractions.build
  end

  # GET vacations/1/attractions/1/edit
  def edit
  end

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

  # PUT vacations/1/attractions/1
  def update
    if !@attraction
      redirect_to vacation_attractions_path
    elsif @attraction.update_attributes(attraction_params)
      redirect_to(vacation_attractions_path, notice: 'Attraction was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE vacations/1/attractions/1
  def destroy
    @attraction.destroy

    redirect_to vacation_attractions_url(@vacation)
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
