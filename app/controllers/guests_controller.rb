class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET vacations/1/guests
  def index
    @guests = @vacation.guests
  end

  # GET vacations/1/guests/1
  def show
  end

  # GET vacations/1/guests/new
  def new
    @guest = @vacation.guests.build
  end

  # GET vacations/1/guests/1/edit
  def edit
  end

  # POST vacations/1/guests
  def create
    @guest = @vacation.guests.build(guest_params)

    if @guest.save
      redirect_to(vacation_path(@vacation))
    else
      render action: 'new'
    end
  end

  # PUT vacations/1/guests/1
  def update
    if @guest.update_attributes(guest_params)
      redirect_to([@guest.vacation, @guest], notice: 'Guest was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE vacations/1/guests/1
  def destroy
    @guest.destroy

    redirect_to vacation_guests_url(@vacation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = @vacation.guests.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name)
    end
end
