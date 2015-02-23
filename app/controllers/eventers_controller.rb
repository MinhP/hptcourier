class EventersController < ApplicationController
  

  def update
    # Find person's order for event
    eventer = Eventer.where(event_id: params[:event_id], user_id: current_user.id).first
    if eventer.nil?
      eventer = Eventer.new(user_id: current_user.id, event_id: params[:event_id], event_status: "Going")
      eventer.save
    else
      if params[:status]
        eventer.update_attribute(:event_status, params[:status])
      else
        if eventer.event_status == "Going"
          eventer.update_attribute(:event_status, "Not Going")
        else   
          eventer.update_attribute(:event_status, "Going")
        end
      end
    end
    if request.xhr?
      render json: eventer
    else
      redirect_to(:back)
    end
  end
  
  def destroy
    Eventer.find(params[:id]).destroy
    if request.xhr?
      head :ok
    else
      redirect_to(:back)
    end
  end
  
  def show
    @eventer = Eventer.find(params[:id])
  end
  
end