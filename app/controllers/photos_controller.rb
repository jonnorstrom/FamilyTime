class PhotosController < ApplicationController
  before_action :set_photos
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET vacations/1/photos
  def index
    @photos = @vacation.photos
  end

  # GET vacations/1/photos/1
  def show
  end

  # GET vacations/1/photos/new
  def new
    @photo = @vacation.photos.build
  end

  # GET vacations/1/photos/1/edit
  def edit
  end

  # POST vacations/1/photos
  def create
    @photo = @vacation.photos.build(photo_params)

    if @photo.save
      redirect_to([@photo.vacation, @photo], notice: 'Photo was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT vacations/1/photos/1
  def update
    if @photo.update_attributes(photo_params)
      redirect_to([@photo.vacation, @photo], notice: 'Photo was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE vacations/1/photos/1
  def destroy
    @photo.destroy

    redirect_to vacation_photos_url(@vacation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photos
      @vacation = Vacation.find(params[:vacation_id])
    end

    def set_photo
      @photo = @vacation.photos.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:name, :descrioption, :user_id)
    end
end
