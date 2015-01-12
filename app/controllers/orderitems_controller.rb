class OrderitemsController < ApplicationController
  def update
    Orderitem.find(params[:id]).update_attribute(:ispurchased, params[:toggle])
    redirect_to(:back)
  end
end