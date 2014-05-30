require 'spec_helper'


describe 'tags FEATURES' do 

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		login_as @user
		visit '/posts/new'
		fill_in 'Comment',with: 'Hank Moody is number #one'
		click_button 'Create Post'
		
		click_link 'Create Post'
		fill_in 'Comment',with: 'Hank Moody is number #two also'
		click_button 'Create Post'

		click_link 'Create Post'
		fill_in 'Comment',with: 'Hank Moody is number #one really'
		click_button 'Create Post'
	end


	it 'should show tags in captions or comments as tag links' do 
		expect(page).to have_link '#one'
		expect(page).to have_link '#two'
	end

	it 'should show tags in captions or comments as tag links' do 
		expect(page).to have_link '#one'
		# click_link 
		first(:link, '#one').click
		expect(current_path).to eq('/tags/one')
	end




end