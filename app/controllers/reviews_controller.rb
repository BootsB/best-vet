class ReviewsController < ApplicationController
  before_action :set_appointment
  before_action :authorize_review, only: [:new, :create]

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = @appointment.reviews.build(review_params)

    if @review.save
      redirect_to @appointment, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def authorize_review
    authorize @appointment, :create_review?
  end
end
