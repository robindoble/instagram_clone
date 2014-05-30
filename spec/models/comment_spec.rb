require 'spec_helper'

describe 'comments create tags' do
  
	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@post = @user.posts.create
		login_as @user
	end

	it 'when hashtags are prepended to words' do 
		@comment = @post.comments.create(comment: 'This is a #flash', user: @user)
		@comment.create_hashtags
		expect(@post.comments.first.user.username).to eq('hankmoody')
		expect(Tag.all.count).to eq(1)
		expect(Tag.first.posts.first).to eq(@post)
	end



end
