class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]

  def index

  end

  def show
    authorize @post
    @reply = Reply.new
    @user_profile = @post.user.user_profile
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to category_url(@post.category), notice: "Successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :category_id, :content)
  end

end
