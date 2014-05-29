class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
  	@posts = Post.all
    @comment = Comment.new
  end

  def new
  	@post=Post.new
  end

  def create
  	@post = Post.new(params[:post].permit(:picture))
    @post.user = current_user
    @post.save

    @post.comment = params[:post][:comment]

    redirect_to('/posts')
  end


end
