require 'spec_helper'

describe 'Post MODEL' do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
	end

  it 'posts should only be created with a username' do 
  	Post.create
  	expect(Post.all.count).to eq(0)
  	Post.create(:user_id => @user.id)
  	expect(Post.all.count).to eq(1)
  end


	# it 'comments on posts also create hashtags' do 
	# 	@user.posts.create(comment: 'This is a #hashtag test')
	# 	# expect(Comment.count).to eq(1)
	# 	expect(Tag.count).to eq(1)
	# 	# expect(Comment.count).to eq(1)

	# end

end







