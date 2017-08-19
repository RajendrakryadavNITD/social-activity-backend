class AddPost < ActiveRecord::Base
	# belongs_to :user
  	belongs_to :location
	# belongs_to :category
	def self.save_post(params)
	    @posts = params['add_post']
	    @post = AddPost.new
	    @post.title = @posts['title']
	    @post.description = @posts['description']
	    @post.category_id = @posts['category_id']
	    @post.location_id = @posts['location_id']
	    @post.user_id = @posts['user_id']
	    @post.save
	    return @post.id		
	end
end
