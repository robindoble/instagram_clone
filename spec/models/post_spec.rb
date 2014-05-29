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


end


