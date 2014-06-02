module PostsHelper
	def linkify_tags(comment)
		comment.gsub(/#(\S+)/, "<a href='/tags/\\1'>\\0</a>").html_safe
	end

	def user_likes?(post)
		current_user.likes.find {|like| like.post == post}
	end


end
