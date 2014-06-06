class ProfilesController < ApplicationController

  before_action :authenticate_user!

	def show
		# raise 'hello'

		@user = Post.find(params[:post_id]).user
		@posts = @user.posts
		@comment = Comment.new
	end

end
