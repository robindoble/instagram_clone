require 'spec_helper'

describe 'posts' do 

	context 'while not logged in' do

		it 'should always prompt users to login' do
			visit '/posts'
			expect(page).to have_content('You need to sign in or sign up')
			expect(page).not_to have_content('Create Post')
		end

	end

	context 'when logged in' do 

		before do 
			user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
			login_as user
		end

		it 'should have no posts to begin with' do  
			visit '/posts'
			expect(page).to have_content('No posts yet')
		end

		it 'you can add posts' do  
			visit '/posts'
			click_on 'Create Post' 
			expect(current_path).to eq('/posts/new')
			fill_in 'Caption',with: 'This is an amazing photo'
			click_on 'Create Post'
			expect(page).to have_content('This is an amazing photo')
		end

		it 'posts should display the username' do  
			visit '/posts'
			click_on 'Create Post' 
			expect(current_path).to eq('/posts/new')
			fill_in 'Caption',with: 'This is an amazing photo'
			click_on 'Create Post'
			expect(page).to have_content('This is an amazing photo')
		end

	end

end