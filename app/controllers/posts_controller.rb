class PostsController < ApplicationController
  
  def index
  	@posts = Post.all
  end

  def new
  	@post=Post.new
  end

  def create
  	# raise 'hello'
  	@post = Post.create(params[:post].permit(:caption))
  	redirect_to('/posts/index')
  end


end
