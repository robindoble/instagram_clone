class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
  	@posts = Post.all
  end

  def new
  	@post=Post.new
  end

  def create
    # current_user = User.find(session[:user_id]
    # puts current_user
    # raise 'hello'
  	@post = Post.new(params[:post].permit(:caption,:picture))
    @post.user = current_user
    @post.save
    redirect_to('/posts')
  end


end
