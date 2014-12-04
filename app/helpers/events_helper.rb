module EventsHelper
  def get_event_name(event_id)
    Event.find(event_id).name
  end
end
