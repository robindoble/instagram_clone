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

    unless params[:post][:comment].blank?
      @post.create_comment(params[:post][:comment])
    end

    redirect_to('/posts')
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy if (@post.user == current_user)
    redirect_to 'posts'
  end

end
