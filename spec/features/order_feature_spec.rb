require 'spec_helper'

describe 'Orders' do

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user.posts.create
		@admin = Admin.last
	end


	it 'should have no orders' do 
		login_as @admin,scope: :admin
		visit '/orders'
		expect(page).to have_content('No orders yet')
	end


end 