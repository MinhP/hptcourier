class AdminController < ApplicationController
  before_action :authenticate_user!
   before_filter do 
    redirect_to :new_user_session_path unless current_user && current_user.is_admin?
  end

  def approve
    @approve_users = User.where(is_approved: false)
  end

  def approve_user
    user = User.find(params[:id])
    user.is_approved = true
    user.save

    redirect_to :approve
  end
end