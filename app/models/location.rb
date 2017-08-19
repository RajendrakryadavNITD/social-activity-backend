class Location < ActiveRecord::Base
	def self.save_location(params)
	    @locations = params['location']
	    @location = Location.new
	    @location.country = @locations['country']
	    @location.state = @locations['state']
	    @location.city = @locations['locality']
	    @location.area = @locations['sublocality']
	    @location.save
	    return @location.id		
	end
end
