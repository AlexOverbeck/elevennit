class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
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

  def edit
  end

  def update
    if @post.update_attributes allowed_params
      redirect_to posts_path, flash: { notice: "Post was updated successfully" }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { notice: "Post was removed" }
    else
      redirect_to posts_path, flash: { notice: "You are unable to remove this post" }
    end
  end

  private
  def find_post
    @post = Post.find params[:id]
  end

  def allowed_params
    params.require(:post).permit(:title, :link, :body, :post_type)
  end
end
