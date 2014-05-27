require 'spec_helper'

describe 'posts' do 

	it 'should have no posts to begin with' do  
		visit '/posts'
		expect(page).to have_content('No posts yet')
	end




end