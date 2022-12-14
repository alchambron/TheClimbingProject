class CheckoutSubscriptionController < ApplicationController
  # create session stripe
  def create
    subscription_order = OrderSubscription.new(session[:book_subscription])
    @price = subscription_order.subscription.price
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [
        {
          price_data: {
            product_data: {
              name: 'Rails Stripe Checkout'
            },
            unit_amount: (@price * 100).to_i,
            currency: 'eur'
          },
          quantity: 1
        }
      ],

      success_url: checkout_subscription_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_subscription_cancel_url
    )
    redirect_to(@session.url, allow_other_host: true)
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    OrderSubscription.create(session[:book_subscription])

    session[:book_subscription] = nil
    redirect_to(root_path, notice: 'Votre abonnements a été validée et sera traitée dans les plus brefs délais.')
  end

  def cancel
    redirect_to(subscriptions_path, alert: 'Votre paiement a été annulé. Merci de rééssayer.')
  end
end
