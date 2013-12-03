class GooglevrController < ApplicationController
	protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'  #Rails 4
	# skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	def create
		@message = params[:message]
		@response = {"message"=>@message}
      	respond_to do |format|
      	format.json {render :json => @response}
      end
    end
end