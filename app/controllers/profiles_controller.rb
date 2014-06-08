class ProfilesController < ApplicationController

  before_action :authenticate_user!

	def show
		# raise 'hello'
		@user = User.find(params[:user_id])
		@posts = @user.posts
		@comment = Comment.new
	end

end
