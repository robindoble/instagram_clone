require 'spec_helper'

describe Like do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@post1 = @user.posts.create(:caption => 'This is a post test')
		@post2 = @user.posts.create(:caption => 'This is a post test')
	end

  it 'a user can only like a post once' do 
  	like = @post1.likes.create
  	like.user = @user
  	expect(like.save).to eq(true)
  	like = @post1.likes.create
  	like.user = @user
  	expect(like.save).to eq(false)
  end

  it 'user can like more than one post' do 
  	like = @post1.likes.create
  	like.user = @user
  	expect(like.save).to eq(true)
  	like = @post2.likes.create
  	like.user = @user
  	expect(like.save).to eq(true)
  end




end

