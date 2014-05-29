require 'spec_helper'

describe 'Like MODEL' do

	before do 
		@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@post1 = @user.posts.create(:caption => 'This is a post test')
		@post2 = @user.posts.create(:caption => 'This is a post test')
	end

	context 'adding like' do 

	  it 'a user can only like any individual post once' do 
	  	like = @post1.likes.new
	  	like.user = @user
	  	expect(like.save).to eq(true)
	  	like = @post1.likes.new
	  	like.user = @user
	  	expect(like.save).to eq(false)
	  end

	  it 'user can like more than one post' do 
	  	like = @post1.likes.new
	  	like.user = @user
	  	expect(like.save).to eq(true)
	  	like = @post2.likes.new
	  	like.user = @user
	  	expect(like.save).to eq(true)
	  end

	end

	context 'deleting likes' do 

		it 'a user can unlike their like for any given post' do 
			like = @post1.likes.new
	  	like.user = @user
	  	like.save
	  	expect(Like.all.count).to eq(1)
	  	like.destroy
	  	expect(Like.all.count).to eq(0)
		end
 
	end

	context 'deleting a post deletes all its likes' do 

		it 'deletes posts as well' do 
			like = @post1.likes.new
	  	like.user = @user
	  	like.save
	  	@post1.destroy
	  	expect(Like.all.count).to eq(0)
		end

	end



end

