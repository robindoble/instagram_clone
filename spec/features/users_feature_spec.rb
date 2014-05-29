# require 'spec_helper'

# describe User do 

# 	before do 
# 		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
# 		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')
# 		@post1 = @user1.posts.create
# 			Comment.create(post: @post, user: @user1, comment: 'This is a post test 1')
# 		@post2 = @user1.posts.create
# 			Comment.create(post: @post, user: @user1, comment: 'This is a post test 2')
# 		@post3 = @user2.posts.create
# 			Comment.create(post: @post, user: @user2, comment: 'This is a post test 3')
# 		@post4 = @user2.posts.create
# 			Comment.create(post: @post, user: @user2, comment: 'This is a post test 4')
# 	end

# 	it 'user page should only show posts for that specific user' do 
# 		# visit '/users/:@user1'
# 		login_as @user1
# 		visit profile_path(@user1)
# 		expect(page).to have_content('This is a post test 1')
# 		expect(page).to have_content('This is a post test 2')
# 		expect(page).not_to have_content('This is a post test 3')
# 		expect(page).not_to have_content('This is a post test 4')
# 	end


# end