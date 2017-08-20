class User < ActiveRecord::Base

	def self.save_user(params)
		@user = User.new
		@user.phone = params['phone']
		@user.save
		return @user
	end
end
