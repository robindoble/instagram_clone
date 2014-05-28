class ProfilesController < ApplicationController

  before_action :authenticate_user!

	def show
		puts current_user
		current_user.posts
		# current_user
		@user = current_user
	end

end
