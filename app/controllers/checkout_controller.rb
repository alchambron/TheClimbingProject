class CheckoutController < ApplicationController
  # create session stripe
  def create
    @price = 10 # @course.price_course
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
      # défini les sessions
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}', # ajout de l'ID de la session
      cancel_url: checkout_cancel_url
    )

    redirect_to(@session.url, allow_other_host: true)

    # respond_to do |format|
    #  # renders create.js.erb
    #  format.js # dans cette page create injecte moi du javascript
    # end
  end

  def success
    # extrait moi les infos de la session
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    # extrait moi les infos par rapport au montant qui a réelement payé lors de cette session
    # @payment_intent = Stripe::PaymentIntent.retrieve(params[:session_id])

    # On enregistre la commande dans la base
    order = Order.create(user_id: current_user.id)
    @cart.courses_ids.each { |course_id| OrderRow.create(order_course_id: order_course.id, course_id: course_id) }

    # On vide le panier
    # @cart.make_empty
    # session[:cart] = @cart
    # On redirige vers la page Mes commandes ( mais il n'y en a pas alors on redirige vers l'accueil)
    redirect_to(
      order_path(order_course.id),
      notice: 'Votre commande est validée et sera traitée dans les plus brefs délais.'
    )
  end

  def cancel
    # @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    # @payment_intent = Stripe::PaymentIntent.retrieve(params[:session_id])
    # On redirige vers la liste du panier avec un flash error
    redirect_to(cart_list_courses_path, alert: 'Votre paiement a été annulé. Merci de rééssayer.')
  end
end
