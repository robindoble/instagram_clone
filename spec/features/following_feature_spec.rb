require 'spec_helper'

describe 'FOLLOWING Features users following other users' do 

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user1.posts.create
	end

	it 'users can like photos and the likes should be shown', js: true do 
		login_as @user2
		visit '/posts'
		# save_and_open_page
		expect(page).to have_link @user1.username
		click_link @user1.username
		save_and_open_page
		expect(page).to have_link 'Follow user'
		# click_link 'Follow user'
	end

end