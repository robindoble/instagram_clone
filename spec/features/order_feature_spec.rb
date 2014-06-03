require 'spec_helper'

describe 'Orders' do

	before do 
		@user = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@post = @user.posts.create
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

		context 'with orders' do 
			


			it 'users should be directed back to signup' do 
				visit '/orders'
				expect(current_path).to eq('/admins/sign_in')
			end
		end


		context 'with orders' do 

			before do 
				login_as @admin, scope: :admin
				christmas_day = Date.new(2013, 12, 25)
				Order.create(id: 1, post: @post, user: @user, created_at: christmas_day)
				# puts Order.first.user.username
				# puts Order.first.post.id
				visit '/orders'
			end

			it 'should display the product' do 
				expect(page).to have_link @post.id
			end

			it 'should display the product' do 
				expect(page).to have_content @user.username
			end


		end



end 