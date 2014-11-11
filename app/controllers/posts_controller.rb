class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new allowed_params
    if post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
  def allowed_params
    params.require(:post).permit(:title, :link, :body)
  end
end
