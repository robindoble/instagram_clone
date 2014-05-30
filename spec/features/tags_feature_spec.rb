require 'spec_helper'


describe 'tags FEATURES' do 

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user.posts.create
	end


	it 'should show tags in captions or comments as tag links' do 
		login_as @user
		visit '/posts/new'
		fill_in 'Comment',with: 'Hank Moody is number #one'
		click_button 'Create Post'
		expect(page).to have_link '#one'
	end


end