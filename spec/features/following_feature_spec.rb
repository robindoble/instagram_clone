# require 'spec_helper'

# describe 'FOLLOWING Features users following other users' do 

# 	before do 
# 		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
# 		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
# 		@user1.posts.create
# 	end

# 	it 'users can like photos and the likes should be shown', js: true do 
# 		login_as @user2
# 		visit '/posts'
# 		expect(page).to have_link 'Follow'
# 		# expect(page).to have_content 'hankmoody likes'
# 	end
