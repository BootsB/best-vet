class ReviewsController < ApplicationController
  def create
    @appointment = Appointment.find(params[:appointment_id])
    @review = @appointment.reviews.build(review_params)
    authorize @review

    if @review.save
      redirect_to @appointment, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
