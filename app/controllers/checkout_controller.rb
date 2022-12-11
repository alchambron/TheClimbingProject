class CheckoutController < ApplicationController
  # create session stripe
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

      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}', # ajout de l'ID de la session
      cancel_url: checkout_cancel_url
    )

    redirect_to(@session.url, allow_other_host: true)
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    OrderCourse.create(session[:book_course])
    session[:book_course] = nil
    redirect_to(courses_path, notice: 'Votre commande est validée et sera traitée dans les plus brefs délais.')
  end

  def cancel
    redirect_to(ourses_path, alert: 'Votre paiement a été annulé. Merci de rééssayer.')
  end
end
