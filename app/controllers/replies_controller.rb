class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = @post
    if @reply.save
      redirect_to @post, notice: "Reply sent"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
