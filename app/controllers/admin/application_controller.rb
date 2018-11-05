class Admin::ApplicationController < ApplicationController
	before_action :authorize_admin!
	skip_after_action :verify_authorized
  

  def index
    @events = Event.all
  end





  private
  	def authorize_admin!
  		authenticate_user!


  		unless current_user.admin?
  			redirect_to root_path, alert: "You don't have admin priviledges!"
  		end
  	end
end