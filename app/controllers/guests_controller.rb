class GuestsController < ApplicationController
  # POST vacations/1/guests
  def create
    @guest = @vacation.guests.build(guest_params)

    if @guest.save
      if request.xhr?
        render :json => {:html => (render_to_string partial: 'guest.html.erb', :locals => {guest: @guest})}
        # render_to_string(:partial => 'partial_file.html', :locals => {:variable => variable}, :format => :html)
      else
        redirect_to(@vacation)
      end
    else
      render action: 'new'
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name)
    end
end
