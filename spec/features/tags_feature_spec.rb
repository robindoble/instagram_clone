require 'spec_helper'


describe 'tags FEATURES' do 

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		login_as @user
		visit '/posts'
		click_link 'Create Post'
		fill_in 'Comment',with: 'Hank Moody is number #one'
		click_on 'Create'
		
		visit '/posts'
		click_link 'Create Post'
		fill_in 'Comment',with: 'Hank Moody is number #two also'
		click_on 'Create'

		visit '/posts'
		click_link 'Create Post'
		fill_in 'Comment',with: 'Hank Moody is number #one really'
		click_on 'Create'
	end


	it 'should show tags in captions or comments as tag links' do 
		# visit '/posts'
		expect(page).to have_content'hankmoody'
		expect(page).to have_link '#one'
		expect(page).to have_link '#two'
	end

	it 'should show tags in captions or comments as tag links' do 
		# visit '/posts'
		expect(page).to have_link '#one'
		# click_link 
		first(:link, '#one').click
		expect(current_path).to eq('/tags/one')
	end




end