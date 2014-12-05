class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: :desc)
  end

  def show
    @order_status = false
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
    @order_status = true if Order.where(event_id: params[:id], user_id: 1)
  end

  def new
    @event = Event.new
  end

  def create
    new_event = Event.new
    new_event.name = params[:event][:name]
    new_event.location = params[:event][:location]
    new_event.date = params[:event][:date]
    new_event.url = params[:event][:url]
    begin
      new_event.save
    rescue
      puts "failed"
    end
    redirect_to :controller => :events, :action => :index
  end

end
