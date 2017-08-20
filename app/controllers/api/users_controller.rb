class Api::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		if params['phone'].present?
			@user = User.save_user(params)
	    	respond_to do |format|
		       format.json { render json: { "status" => true, "message" => @user }, status: :created }
	        end
	    else
	      respond_to do |format|
	        format.json { render json: { "status" => false, "message" => "Parameter missing" }, status: :ok }
	      end
		end
	end
end