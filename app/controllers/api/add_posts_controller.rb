class Api::AddPostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_location
  	puts "PArams: #{params.inspect}"
    if params['location'].present?
    	@location_id = Location.save_location(params)
    	respond_to do |format|
	        format.json { render json: { "status" => true, "message" => @location_id }, status: :created }
        end
    else
      respond_to do |format|
        format.json { render json: { "status" => false, "message" => "Parameter missing" }, status: :ok }
      end
    end
  end

    def create_post
  	puts "PArams: #{params.inspect}"
    if params['add_post'].present?
    	@add_post_id = AddPost.save_post(params)
    	respond_to do |format|
	        format.json { render json: { "status" => true, "message" => @add_post_id }, status: :created }
        end
    else
      respond_to do |format|
        format.json { render json: { "status" => false, "message" => "Parameter missing" }, status: :ok }
      end
    end
  end
end
