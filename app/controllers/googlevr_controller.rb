class GooglevrController < ApplicationController
	def create
		@message = params[:message]
		@response = {"message"=>@message}
    	respond_to do |format|
      	format.json {render :json => @response}
    end
end
