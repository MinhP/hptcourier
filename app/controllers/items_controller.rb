class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    new_item = Item.new
    new_item.name = params[:item][:name]
    new_item.description = params[:item][:description]
    new_item.price = params[:item][:price]
    new_item.image_url = params[:item][:image_url]
    new_item.event_id = params[:id]
    begin
      new_item.save
    rescue
      puts "failed"
    end
    redirect_to :controller => :events, :action => :show, :id => params[:id]
  end
end
