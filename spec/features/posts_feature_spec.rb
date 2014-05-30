require 'spec_helper'

describe 'Post FEATURES' do 

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
			@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
			login_as @user
		end

		context 'without any posts' do 

			it 'should have no posts to begin with' do  
				visit '/posts'
				expect(page).to have_content('No posts yet')
			end

			it 'users can add posts' do  
				visit '/posts'
				click_link 'Create Post' 
				expect(current_path).to eq('/posts/new')
				fill_in 'Comment',with: 'This is an amazing photo'
				click_button 'Create Post'
				# save_and_open_page
				expect(page).to have_content('This is an amazing photo')
			end
	
		end

		context 'posts show the username' do 

			before do
				post = Post.new
				post.user = @user
				post.save
			end

			it 'of the post' do  
				visit '/posts'
				expect(current_path).to eq('/posts')
				
				expect(page).to have_content('robindoble')
			end

		end


		context 'adding pictures to each post' do 

			it 'and the picture should be displayed' do 
				visit '/posts/new'
				fill_in 'Comment',with: 'This is an amazing photo'
				attach_file 'Picture', Rails.root.join('spec/images/image.jpeg')
				click_button 'Create Post'
				# expect(current_path).to eq new_posts_path
				expect(page).to have_content 'This is an amazing photo'
				expect(page).to have_css 'img.uploaded_pic'
			end

		end

		context 'deleting posts' do 

			it 'users can delete their own posts' do 
				visit '/posts/new'
				fill_in 'Comment',with: 'This is an amazing photo'
				attach_file 'Picture', Rails.root.join('spec/images/image.jpeg')
				click_button 'Create Post'
				expect(page).to have_content 'This is an amazing photo'
				click_link 'Delete Post'
				expect(page).not_to have_content 'This is an amazing photo'

			end

				it 'users can delete their own posts' do 
				visit '/posts/new'
				fill_in 'Comment',with: 'This is an amazing photo'
				click_button 'Create Post'
				expect(page).to have_content 'This is an amazing photo'
				logout
				login_as @user2
				visit '/posts'
				click_link 'Delete Post'
				expect(page).to have_content 'This is an amazing photo'
			end
		end

	end
end


describe 'POST Features adding likes to pictures' do 

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
		@user1.posts.create
	end

	it 'users can like photos and the likes should be shown' do 
		login_as @user1
		visit '/posts'
		click_on 'Like'
		logout
		login_as @user2
		visit '/posts'
		click_on 'Like'
		expect(page).to have_content 'robindoble'
		expect(page).to have_content 'hankmoody'
	end


	it 'users can unlike posts as well' do 
		login_as @user2
		visit '/posts'
		click_on 'Like'
		expect(page).to have_content 'hankmoody'
		click_on 'Unlike'
		expect(page).not_to have_content 'hankmoody'
	end


end





