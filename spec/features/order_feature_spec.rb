require 'spec_helper'

describe 'Orders' do

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user.posts.create
		@admin = Admin.create
	end

		context 'logged in as admin' do 
			it 'should have no orders' do 
				login_as @admin, scope: :admin
				visit '/orders'
				expect(page).to have_content('No orders yet')
			end
		end

		context 'not logged in as admin' do 
			it 'users should be directed back to signup' do 
				visit '/orders'
				expect(current_path).to eq('/admins/sign_in')
			end
		end





end 