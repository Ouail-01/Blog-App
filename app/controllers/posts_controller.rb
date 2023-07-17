class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.posts
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
