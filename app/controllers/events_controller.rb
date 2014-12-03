class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @order = Order.where(eventid: params[:id])
    @event = Event.find(params[:id])
    @items = Item.where(eventid: params[:id])
  end
end
