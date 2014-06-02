class LikesController < ApplicationController

def create
	# raise 'hello'
	@post = Post.find(params[:post_id])
	@like = @post.likes.new
	@like.user = current_user
	@post.likes.find_by(user: current_user)
	@like.save
	# @action = 'create'
	render 'create', content_type: :json
end

def destroy
	@like = Post.find(params[:post_id]).likes.where(:user => current_user)
	puts 'start'
	puts @like
	@like.first.destroy if @like.any?
	puts @like
	puts 'end'
	redirect_to '/posts'
	puts @like
end

end
