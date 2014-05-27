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
			@user = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
			login_as @user
		end

		context 'without users' do 

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
	
		end

		context 'posts showing a username' do 

			before do
				post = Post.new(:caption => 'This is a post test'	)
				post.user = @user
				post.save
			end

			it 'posts should display the username' do  
				visit '/posts'
				expect(current_path).to eq('/posts')
				expect(page).to have_content('This is a post test')
				expect(page).to have_content('robindoble')
			end

		end


		context 'adding pictures to each post' do 

			it 'posts pictures should be displayed' do 
				visit '/posts/new'
				fill_in 'Caption',with: 'This is an amazing photo'
				attach_file 'Picture', Rails.root.join('spec/images/image.jpeg')
				click_on 'Create Post'
				expect(current_path).to eq posts_path
				expect(page).to have_content 'This is an amazing photo'
				expect(page).to have_css 'img.uploaded_pic'
			end

		end

	end
end


describe 'adding likes to pictures' do 

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user1.posts.create(:caption => 'This is a post test')
	end

	it 'users can like photos and the likes should be shown' do 
		login_as @user1
		visit '/posts'
		click_on 'Like'
		logout
		login_as @user2
		visit '/posts'
		click_on 'Like'
		expect(page).to have_content 'robindoble likes'
		expect(page).to have_content 'hankmoody likes'
	end



end









