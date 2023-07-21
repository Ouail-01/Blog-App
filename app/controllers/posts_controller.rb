class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
