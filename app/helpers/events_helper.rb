module EventsHelper
  def get_event_name(event_id)
    Event.find(event_id).name
  end
  
  def format_price(event_id, value)
    _event = Event.find(event_id)
    number_to_currency(value, unit: _event.cur_prefix, precision: _event.cur_precision )
  end
  
end
