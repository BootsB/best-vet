class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = policy_scope(Category)
    if params[:search].present? && params[:search][:query].present?
      @categories = Category.where("description LIKE ?", "%#{params[:search][:query]}%")
    else
      @categories = Category.all
    end
  end

  def show
    authorize @category
    if params[:search].present? && params[:search][:query].present?
      @posts = Post.where("content LIKE ?", "%#{params[:search][:query]}%")
    else
      @posts = @category.posts
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
