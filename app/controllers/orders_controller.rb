class OrdersController < ApplicationController
  def create
    skip_authorization
    membership = Membership.find(params[:membership_id])
    @order = Order.create!(membership: membership, membership_sku: membership.sku, amount: membership.price, state: 'pending', user_profile: current_user.user_profile)

    session = Stripe::Checkout::Session.create(
      {
        payment_method_types: ["card"],
        mode: "payment",
        line_items: [{
          quantity: 1,
          price_data: {
            unit_amount: membership.price_cents,
            currency: 'gbp',
            product_data: {
              name: membership.sku
            }
          }
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      }
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.user_profile.orders.find(params[:id])
    authorize @order
    order = Order.find(params[:id])
    current_user.user_profile.membership = order.membership
    current_user.user_profile.save!
  end
end
