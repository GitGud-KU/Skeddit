class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_format

  #Simply redirects back to home page. Required since refreshing after a failed validation will bring you to this index.
  def index
    redirect_to (events_path)
  end

  def new
    @availability = Availability.find_or_initialize_by(event_id: params[:event_id], user_id: current_user.id)
    @times_allowed = @availability.event.times_allowed.map(&:to_datetime)
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      redirect_to(event_path(@availability.event_id))
    else
      @times_allowed = @availability.event.times_allowed.map(&:to_datetime)
      render :new
    end
  end

  def edit
    @availability = Availability.find(event_id: params[:event_id], user_id: current_user.id)
    @times_allowed = @availability.event.times_allowed.map(&:to_datetime)
  end

  def update
    @availability = Availability.find(event_id: params[:event_id], user_id: current_user.id)
    if @availability.update(availability_params)
      redirect_to (events_path)
    else
      @times_allowed = @availability.event.times_allowed.map(&:to_datetime)
      render :new
    end
  end

  def destroy
    @availability = Availability.find(event_id: params[:event_id], user_id: current_user.id)
    @availability.destroy if @availability.owner == current_user
    redirect_to(events_path)
  end

  private

  def availability_params
    params.require(:availability).permit(:event_id,:user_id,:times_available => [])
  end

  def check_format
    @hour_format = session[:hour_format] || 12
  end
end
