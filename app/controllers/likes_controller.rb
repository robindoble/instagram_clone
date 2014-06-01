class LikesController < ApplicationController

def create
	# raise 'hello'
	@post = Post.find(params[:post_id])
	@like = @post.likes.new
	@like.user = current_user
	@like.save
	render 'create', content_type: :json
end

def destroy
	@like = Post.find(params[:post_id]).likes.where(:user => current_user)
	@like.first.destroy if @like.any?
	redirect_to '/posts'
end

end
