require 'spec_helper'

describe 'comments' do 


	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user.posts.create(:caption => 'This is a post test')
	end

	it 'users can leave a comment on a post' do 
		login_as @user
		visit '/posts'
		fill_in 'Comment', with: 'Hank, your picture is amazing'
		click_on 'Create comment'
		expect(page).to have_content 'Hank, your picture is amazing'
	end


end