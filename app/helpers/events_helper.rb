module EventsHelper

  # Get a list of the participants available for a specified event at a specified time.
  def available_participants(participants,event,time)
    participants.select{|p| p.is_available_at_event_and_time?(@event,time) }
  end
end
