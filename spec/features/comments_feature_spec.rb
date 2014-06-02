require 'spec_helper'

describe 'comments FEATURE' do 


	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user1.posts.create(picture: Rails.root.join('spec/images/image.jpeg').open)
	end


	it 'users can leave a comment on a post', js: true do 
		login_as @user2
		visit '/posts'
		fill_in 'Comments...', with: 'Hank, your picture is amazing'
		click_on 'Create comment'
		expect(page).to have_content 'Hank, your picture is amazing'
		expect(page).to have_content @user2.username
	end

	it 'blank comment submissions are not saved', js: true do 
		login_as @user2
		visit '/posts'
		fill_in 'Comments...', with: ''
		click_on 'Create comment'
		expect(page).not_to have_content @user2.username
	end

end