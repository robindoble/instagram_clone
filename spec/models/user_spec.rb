require 'spec_helper'

describe 'User MODEL' do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@post = @user.posts.create
	end

	it 'deleting a user deletes all their posts' do 
	  	@user.destroy 
	  	expect(Post.all.count).to eq(0)
	end
 
	it 'deleting a user deletes all their posts' do 
			like = @post.likes.new
	  	like.user = @user2
	  	like.save
	  	expect(@user2.likes.count).to eq(1)
	  	expect(@post.likes.where(:user => @user2).count).to eq(1)
	  	@user2.destroy 
	  	expect(@post.likes.where(:user => @user2).count).to eq(0)
	end

	it 'should respond to relationships' do 
		expect(@user).should respond_to(:relationships)
	end
 

end

