class EventsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  before_action :check_format

  # Create an instance var of all of the events for use in the events#index page
  def index
    @events = Event.all
    @admin_events = @events.select{|event| event.owner == current_user}
    @other_events = @events.reject{|event| event.owner == current_user}
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
      redirect_to new_event_path
    end
  end

  private

  # Define the permitted params for creating a new event
  def event_params
    params.require(:event).permit(:name,:date,:user_id,:times_allowed => [])
  end

  def check_format
    @hour_format = params[:hr_fmt] || '12'
  end
end
