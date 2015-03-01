class OrderitemsController < ApplicationController
  before_action :authenticate_user!
  before_action :pending_user? 
  
  def update
    Orderitem.find(params[:id]).update_attribute(:ispurchased, params[:toggle])
    if request.xhr?
      head :ok
    else
      redirect_to(:back)
    end
  end
end