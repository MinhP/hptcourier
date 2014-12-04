class OrdersController < ApplicationController
  include OrdersHelper

  def index
    @orders = Order.all
  end

  def list
    @orders = Order.where(user_id: 1)
  end

  def show
    @orderitems = Orderitem.where(order_id: params[:id])
    @total_price = 0
    @items = []
    @orderitems.each do |orderitem|
      item_hash = orderitem.serializable_hash
      item_hash.merge!(Item.find(orderitem.item_id).serializable_hash)
      total_price = item_hash['price'] * item_hash['quantity']
      @total_price = @total_price + total_price
      item_hash.merge!('total_price' => total_price)
      @items << item_hash
    end
  end
end