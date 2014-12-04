class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @order_status = false
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
    @order_status = true if Order.where(event_id: params[:id], user_id: 1)
  end

  def new
    
  end
end
