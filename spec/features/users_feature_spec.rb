require 'spec_helper'

describe User do 

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@post1 = @user1.posts.create
		@post2 = @user2.posts.create	
	end

	it 'user page should only show posts for that specific user' do 
		login_as @user1
		visit '/posts'
		click_link 'robindoble'
		# expect(current_path).to eq(profile_path)
		expect(page).to have_content @user1.username
		expect(page).not_to have_content @user2.username
	end


end