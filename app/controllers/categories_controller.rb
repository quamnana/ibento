class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]
	skip_after_action :verify_authorized


	def show
		@categories = Category.all	
	end




	private

		def set_category
			@category= Category.friendly.find(params[:id])

			rescue ActiveRecord::RecordNotFound
			flash[:alert] = " The category you requested does not exist!"
			redirect_to (request.referrer || events_path)
		end
end