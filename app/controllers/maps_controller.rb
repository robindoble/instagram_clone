class MapsController < ApplicationController

	def show
		# raise 
		@post = Post.find params[:post_id]
	end

end
