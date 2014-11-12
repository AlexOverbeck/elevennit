class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:posts).find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new allowed_params
    if @category.save
      redirect_to categories_path, flash: { notice: "Category was created successfully" }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes allowed_params
      redirect_to categories_path, flash: { notice: "Category was updated successfully" }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, flash: { notice: "Category was removed" }
    else
      redirect_to categories_path, flash: { notice: "You are unable to remove this category" }
    end
  end

  private
  def find_category
    @category = Category.find params[:id]
  end

  def allowed_params
    params.require(:category).permit(:name, :title, :description, :sidebar, :submission_text)
  end
end
