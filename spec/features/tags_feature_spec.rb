require 'spec_helper'


describe 'leaving tags on posts' do 

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user.posts.create(:caption => 'This is a post test')
	end


	it 'should show tags in captions or comments as tag links' do 
		login_as @user
		visit '/posts/new'
		fill_in 'Caption',with: 'Hank Moody is number one'
		
	end


end