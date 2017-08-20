class Api::AddPostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = AddPost.all
    respond_to do |format|
      format.json { render json: { "status" => true, "message" => @posts }, status: :ok }
    end
  end

  def create_location
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

  def categories
    @categories = Category.all
    respond_to do |format|
      format.json { render json: { "status" => true, "message" => @categories }, status: :ok }
    end
  end
end
