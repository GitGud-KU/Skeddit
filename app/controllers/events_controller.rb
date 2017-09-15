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
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.name = current_name
    @event.date = current_date
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

  #Return edit event form?
  def edit

  end

  #Define what to do when updating an event
  def update

  end

  #Define what to do when deleting an event
  def destroy
    @event = nil #?
    redirect_to(events_path)
  end

  private

  def event_params
    params.require(:event).permit(:name,:date,:user_id)
  end
end
