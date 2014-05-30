class CommentsController < ApplicationController

def create
	@post=Post.find(params[:post_id])
	new_comment = @post.comments.new(params[:comment].permit(:comment))
	new_comment.user = current_user
	new_comment.save
	new_comment.create_hashtags
	redirect_to '/posts'
end


end
