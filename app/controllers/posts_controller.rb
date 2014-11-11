class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new allowed_params

    if @post.save
      redirect_to posts_path, flash: { notice: "Post was created successfully" }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  private
  def allowed_params
    params.require(:post).permit(:title, :link, :body, :post_type)
  end
end
