class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def register
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def order_list
    @orderslist = Order.where(user_id: params[:id])
    @orders = []
    @orderslist.each do |order|
      order_hash = order.serializable_hash.merge(Event.find(order.event_id).serializable_hash)
      p order_hash
      @orders << order_hash
    end
    @name = get_user_name(params[:id])
  end
end
