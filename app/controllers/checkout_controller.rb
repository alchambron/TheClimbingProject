class CheckoutController < ApplicationController
  def create
    course_order = OrderCourse.new(session[:book_course])
    @price = course_order.course.price
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

      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    redirect_to(@session.url, allow_other_host: true)
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    final_order_course = OrderCourse.new(session[:book_course])
    final_order_course.charge_id = Stripe::PaymentIntent.retrieve(@session[:payment_intent])[:latest_charge]
    final_order_course.save
    session[:book_course] = nil
    redirect_to(courses_path, notice: 'Votre commande est validée et sera traitée dans les plus brefs délais.')
  end

  def cancel
    redirect_to(courses_path, alert: 'Votre paiement a été annulé. Merci de rééssayer.')
  end

  def refund
    redirection_path = params[:redirection_path]
    refund_order = OrderCourse.find(session[:refund_course])
    @refund_session = Stripe::Refund.create({ charge: refund_order.charge_id })
    if !@refund_session[:status] == 'succeeded'
      redirect_to(redirection_path, alert: "Une erreur est apparu, contacter l'administrateur.")
    else
      redirect_to(
        redirection_path,
        notice: 'Votre cours à bien été annulé, vous serez remboursé dans les 7 prochains jours.'
      )
      refund_order.destroy
    end
  end
end
