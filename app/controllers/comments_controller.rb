class CommentsController < ApplicationController

def create
	@post=Post.find(params[:post_id])
	# raise 'hello'
		unless params[:comment][:comment].blank?
			@new_comment = @post.comments.new(params[:comment].permit(:comment))
			@new_comment.user = current_user
			@new_comment.save
			@new_comment.create_hashtags
			render 'create', content_type: :json
		else
			render nothing: true
		end
	# redirect_to '/posts'
	# render  json: @new_comment
end


end
