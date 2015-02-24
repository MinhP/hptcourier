class EventsController < ApplicationController
  before_action :authenticate_user!
  
  # list of supported currencies
  before_filter :set_currencies
  
  def set_currencies
    @currencies = ['JPY', 'USD', 'CAD', 'SGD', 'GBP', 'EUR', 'HKD']
  end
  
  def index
    @events = Event.all.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
    @order = Order.new
    @eventers = Eventer.where(event_id: params[:id]).where.not(event_status: :notgoing)
    @userevent = @eventers.where(user_id: current_user.id).first
    
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
    new_event.currency = params[:event][:currency]
    begin
      new_event.save
    rescue
      puts "failed"
    end
    redirect_to :controller => :events, :action => :index
  end

  def edit
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
    @currencies
  end

  def update
    p params[:id]
    event = Event.find(params[:id])
    event.name = params[:event][:name]
    event.location = params[:event][:location]
    event.date = params[:event][:date]
    event.currency = params[:event][:currency]
    event.save

    items = params[:event][:items_attributes]
    p items
    items.each do |item|
      item = item.last
      # Add Item if doesn't exist
      if item['id'].nil?
        Item.new(event_id: params[:id], name: item['name'], description: item['description'], price: item['price']).save
      else
        if item['_destroy']
          Item.find(item['id']).destroy
          Orderitem.where(item_id: item['id']).destroy_all
          next
        else
          update_item = Item.find(item['id'])
          update_item.update_attributes(name: item['name'], description: item['description'], price: item['price'])
        end
      end
    end
    redirect_to event_path(params[:id])
  end

  def all_orders
    @event = Event.find(params[:id])
    @orders = Order.where(event_id: params[:id])
  end

  def agg_orders
    @event = Event.find(params[:id])
  end
end
