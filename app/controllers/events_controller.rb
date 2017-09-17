class EventsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  # Create an instance var of all of the events for use in the events#index page
  def index
    @admin_events = Event.select{|event| event.owner == current_user}
      @other_events = Event.select{|event| event.owner != current_user}
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
    @possible_times = Event::POSSIBLE_TIMES_CONST
    #@possible_times = [24 hour mode] ? @possible_times.map{|time| [time,EventsHelper.hour_24(time)]} 
      #: @possible_times.map{|time| [time,EventsHelper.hour_12(time)]}
    @possible_times = @possible_times.map{|time| [time,EventsHelper.hour_24(time)]}
  end

  # Define what to do when creating a new event
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to(events_path)
    else
      @possible_times = Event::POSSIBLE_TIMES_CONST
      @possible_times = @possible_times.map{|time| [time,EventsHelper.hour_24(time)]}
      render :new
    end
  end

  private

  # Define the permitted params for creating a new event
  def event_params
    params.require(:event).permit(:name,:date,:user_id,:times_allowed => [])
  end
end
