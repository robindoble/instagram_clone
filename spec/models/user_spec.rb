require 'spec_helper'

describe User do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@post = @user.posts.create(:caption => 'This is a post test')
	end

	it 'deleting a user deletes all their posts' do 
			# like = @post.likes.new
	  	# like.user = @user
	  	# like.save
	  	@user.destroy 
	  	expect(Post.all.count).to eq(0)
	end
 


end

