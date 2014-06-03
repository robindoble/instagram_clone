require 'spec_helper'

describe 'LIKE Features adding likes to pictures' do 

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		# @user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user1.posts.create
	end

	it 'users can like photos and the likes should be shown', js: true do 
		login_as @user1
		visit '/posts'
		click_on 'Like'
		# logout
		# login_as @user2
		# visit '/posts'
		# click_on 'Like'
		# save_and_open_page
		# expect(page).to have_content 'hankmoody likes'
		expect(page).to have_content 'robindoble likes'
	end


	# it 'users can unlike posts as well', js: true do 
	# 	login_as @user2
	# 	visit '/posts'
	# 	click_on 'Like'
	# 	expect(page).to have_content 'hankmoody likes'
	# 	click_on 'Unlike'
	# 	expect(page).not_to have_content 'hankmoody likes'
	# end

end