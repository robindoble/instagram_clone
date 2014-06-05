class PostsController < ApplicationController
  
  before_action :authenticate_admin_or_user!
  # before_action 

  def index
  	@posts = Post.all
    @comment = Comment.new
  end

  def new
    redirect_to '/posts'
  end

  def create
  	@post = Post.new(params[:post].permit(:picture, :address))
    @post.user = current_user
    @post.save

    unless params[:post][:comment].blank?
      @post.create_comment(params[:post][:comment])
    end

    redirect_to('/posts')
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy if ( @post.user.id == current_user.id )
    redirect_to '/posts'
  end

  private

  def authenticate_admin_or_user!
    return true if admin_signed_in?
    authenticate_user!
  end


end
