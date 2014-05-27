require 'spec_helper'

describe 'posts and usernames' do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
	end

  it 'posts should only be created with a username' do 
  	Post.create(:caption => 'This is a post test')
  	expect(Post.all.count).to eq(0)
  	Post.create(:caption => 'This is a post test',:user_id => @user.id)
  	expect(Post.all.count).to eq(1)
  end


end


describe 'posts and likes' do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@post = @user.posts.create(:caption => 'This is a post test')
	end

  it 'a user can only like a post once' do 
  	like = @post.likes.create
  	like.user = @user
  	expect(like.save).to eq(true)
  	like = @post.likes.create
  	like.user = @user
  	expect(like.save).to eq(false)
  end


end
