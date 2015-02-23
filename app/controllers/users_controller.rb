class UsersController < ApplicationController
  before_action :authenticate_user!
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
  
  def usericon
    @user = User.find(params[:id])
    render :layout => false
  end

  def order_list
    @orders = Order.where(user_id: params[:id])
    @orders_courier = Order.where(courier_id: params[:id])
    @name = get_user_name(params[:id])
  end
end
