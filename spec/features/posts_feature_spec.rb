require 'spec_helper'

describe 'posts' do 

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