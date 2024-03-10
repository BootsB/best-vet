class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    @categories = policy_scope(Category)
  end

  def show
    authorize @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
