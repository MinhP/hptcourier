class OrderitemsController < ApplicationController
  def update
    Orderitem.find(params[:id]).update_attribute(:ispurchased, params[:toggle])
    if request.xhr?
      head :ok
    else
      redirect_to(:back)
    end
  end
end