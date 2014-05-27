require 'spec_helper'

describe Post do

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
