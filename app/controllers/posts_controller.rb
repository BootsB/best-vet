class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]

  def index
    @posts = Post.all
  end

  def show
    @reply = Reply.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to category_url(@post.category), notice: "Successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :category_id, :content)
  end

end
