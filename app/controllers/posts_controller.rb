class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new allowed_params

    if @post.save
      redirect_to posts_path, flash: { notice: "Post was created successfully" }
    else
      flash.now[:error] = 'You broke it. Nice going.'
      render :new
    end
  end

  private
  def allowed_params
    params.require(:post).permit(:title, :link, :body)
  end
end
