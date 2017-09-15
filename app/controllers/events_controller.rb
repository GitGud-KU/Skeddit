class EventsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  # Create an instance var of all of the events for use in the events#index page
  def index
    @events = Event.all
  end

  # Create an instance var of the event with the specified id for the events#show page
  def show
    @event = Event.find(params[:id])
  end

  # Create an instance var for a new event for the events#new pages
  def new
    @event = Event.new
    @event.user_id = current_user.id
    @possible_times = Array.new(48).map.with_index{|x,index| Date.today.to_datetime + index * (1.0/48)}.map{|time| [time,time.strftime('%I:%M:%S %p')]}
  end

  # Define what to do when create a new event
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to(events_path)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name,:date,:user_id,:times_allowed => [])
  end
end
