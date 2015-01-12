class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
    @order = Order.new
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

  def edit
    @event = Event.find(params[:id])
    @items = Item.where(event_id: params[:id])
  end

  def update
    p params[:id]
    event = Event.find(params[:id])
    event.name = params[:event][:name]
    event.location = params[:event][:location]
    event.date = params[:event][:date]
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
    # TODO All order list
    # @order_item_list = []
    
    # event_items = Item.where(event_id: params[:id])
    # event_items.each do |item|
    #   @order_item_list << Orderitem.where(item_id: item.id).sum(:quantity)
    # end

  end
end
