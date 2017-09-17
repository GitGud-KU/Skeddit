class AvailabilitiesController < ApplicationController

  #Simply redirects back to home page. Required since refreshing after a failed validation will bring you to this index.
  def index
    redirect_to (events_path)
  end

  def new
    @availability = Availability.find_or_initialize_by_event_id_and_user_id(params[:event_id], current_user.id)
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      redirect_to(event_path(@availability.event_id))
    else
      #If resources don't load properly upon rerender, add things here.
      render :new
    end
  end

  def destroy

  end

  private

  def availability_params
    params.require(:availability).permit(:event_id,:user_id,:times_available => [])
  end
end

