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

	def user_details
		@user = User.find_by(id: params['user_id'])
		if @user
			respond_to do |format|
			    format.json { render json: { "status" => true, "message" => @user }, status: :created }
		    end
		else
			respond_to do |format|
	        	format.json { render json: { "status" => false, "message" => "Invalid user id" }, status: :ok }
	      end
		end
	end

	def update_profile
		@user = User.find_by(id: params['user_id'])
		@user.name = params['name']
		@user.email = params['email']
		@user.phone = params['phone']
		@user.dob = params['dob']
		@user.address = params['address']
		if @user.save
		   respond_to do |format|
			 format.json { render json: { "status" => true, "message" => @user }, status: :created }
		   end
		else
		   respond_to do |format|
	          format.json { render json: { "status" => false, "message" => "something went wrong" }, status: :ok }
	       end
		end
	end
end