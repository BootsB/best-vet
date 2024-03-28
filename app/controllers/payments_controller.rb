class PaymentsController < ApplicationController
  def new
    skip_authorization
    @order = current_user.user_profile.orders.where(state: "pending").find(params[:order_id])
  end
end
