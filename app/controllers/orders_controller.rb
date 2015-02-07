class OrdersController < ApplicationController
  before_action :authenticate_user!
  include OrdersHelper
  include EventsHelper
  include UsersHelper

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @name = get_user_name(Order.find(params[:id]).user_id)
  end

  def create
    empty_order = true
    # Find person's order for event
    order = Order.where(event_id: params[:event_id], user_id: current_user.id).first
    if order.nil?
      order = Order.new(user_id: current_user.id, event_id: params[:event_id])
      order.save
      new_order_items = params[:order]
      p new_order_items
      new_order_items.each do |new_item|
        next if new_item[1]['quantity'].to_i == 0
        empty_order = false
        new_item = Orderitem.new(order_id: order.id, item_id: new_item[0], quantity: new_item[1]['quantity'].to_i, notes: new_item[1]['notes'])
        new_item.save
      end
    else
      new_order_items = params[:order]
      new_order_items.each do |new_item|
        next if new_item[1]['quantity'].to_i == 0
        empty_order = false
        item = Orderitem.where(order_id: order.id, item_id: new_item[0])
        p item
        if item.empty?
          new_item = Orderitem.new(order_id: order.id, item_id: new_item[0], quantity: new_item[1]['quantity'].to_i, notes: new_item[1]['notes'])
          new_item.save
        else
          item.first.update_attributes(:quantity => new_item[1]['quantity'].to_i + item.first.quantity, :notes => new_item[1]['notes'])
        end
      end
    end
    if empty_order
      redirect_to root_path
    else
      redirect_to order_path(order.id)
    end
  end

  def edit
    @items = Orderitem.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @event = Event.find(@order.event_id)
    redirect_to root_path if current_user.id != @order.user_id
  end

  def update
    if !params[:courier_id].nil?
      Order.find(params[:id]).update_attribute(:courier_id, params[:courier_id])

      redirect_to :back
      return
    end

    if !params[:toggle].nil?
      Order.find(params[:id]).update_attribute(:isdelivered, params[:toggle])
      if request.xhr?
        head :ok
      else
        redirect_to(:back)
      end
      return
    end

    new_order_items = params[:order]
    new_order_items.each do |new_item|
      if new_item[1]['quantity'].to_i == 0
        Orderitem.where(order_id: params[:id], item_id: new_item[0]).destroy_all
        next
      end
      item = Orderitem.where(order_id: params[:id], item_id: new_item[0])
      item.first.update_attributes!(:quantity => new_item[1]['quantity'].to_i, :notes => new_item[1]['notes'])
    end
    if Orderitem.where(order_id: params[:id]).empty?
      puts "destroying order"
      Order.find(params[:id]).destroy
      redirect_to order_list_user_path(current_user.id)
    else
      redirect_to order_path(params[:id])
    end
  end

  def destroy
    Orderitem.where(order_id: params[:id]).destroy_all
    Order.find(params[:id]).destroy

    redirect_to order_list_user_path(current_user.id)
  end
end