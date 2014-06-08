require 'spec_helper'




describe Relationship do

	before do 
		@user1 = User.create(:username => 'robindoble', :email => 'robindoble@gmail.com',:password => 'password',:password_confirmation => 'password')
		@user2 = User.create(:username => 'hankmoody', :email => 'hank@california.com',:password => 'password',:password_confirmation => 'password')	
		@relationship = @user1.relationships.new(followed_id: @user2)
	end

  it 'should be able to save a relationship' do 
  	@relationship.save!
	end

  it 'should respond to following' do 
  	@relationship.should respond_to(:follower)
  	@relationship.should respond_to(:followed)
	end


end
