require 'spec_helper'

describe 'Post FEATURES' do 

	context 'while not logged in' do

		it 'should always prompt users to login' do
			visit '/posts'
			expect(page).to have_content('please sign in')
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

			it 'users can add posts', js: true do  
				visit '/posts'
				click_link 'Create Post' 
				expect(current_path).to eq('/posts')
				fill_in 'Add a comment...',with: 'This is an amazing photo'
				fill_in 'Address', with: '25 City Rd, London'
				click_button 'Create'
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


		context 'adding pictures to each post', js: true do 

			it 'and the picture should be displayed' do 
				visit '/posts/new'
				click_link 'Create Post'
				fill_in 'Add a comment...', with: 'This is an amazing photo'
				attach_file 'Picture', Rails.root.join('spec/images/image.jpeg')
				click_button 'Create'
				# expect(current_path).to eq new_posts_path

				# puts page.html
				expect(page).to have_content 'robindoble'
				expect(page).to have_css 'img.uploaded_pic'
			end

		end

		context 'deleting posts', js: true do 

			it 'users can delete their own posts' do 
				visit '/posts/new'
				click_link 'Create Post'
				fill_in 'Add a comment...',with: 'This is an amazing photo'
				attach_file 'Picture', Rails.root.join('spec/images/image.jpeg')
				click_button 'Create'
				expect(page).to have_content 'This is an amazing photo'
				click_link 'Delete Post'
				expect(page).not_to have_content 'This is an amazing photo'

			end

				it 'users can delete their own posts' do 
				visit '/posts/new'
				click_link 'Create Post'
				fill_in 'Add a comment...',with: 'This is an amazing photo'
				click_button 'Create'
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










