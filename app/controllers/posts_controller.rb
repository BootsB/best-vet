class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.all
  end

  def show
    @reply = Reply.new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end


end
