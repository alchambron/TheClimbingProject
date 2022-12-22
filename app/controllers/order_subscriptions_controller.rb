class OrderSubscriptionsController < ApplicationController
  before_action :set_order_subscription, only: %i[show edit update destroy]
  before_action :check_user_auth, only: %i[book_subscription]

  # GET /order_subscriptions or /order_subscriptions.json
  def index
    @order_subscriptions = OrderSubscription.where(user_id: current_user.id)
  end

  # GET /order_subscriptions/1 or /order_subscriptions/1.json
  def show
    @order_subscriptions = OrderSubscription.find(params[:id])
  end

  # GET /order_subscriptions/new
  def new
    return if session[:user_id].nil?

    @order_subscription = OrderSubscription.create(user_id: session[:user_id])
  end

  # GET /order_subscriptions/1/edit
  def edit; end

  def book_subscription
    if user_signed_in?
      session[:book_subscription] =
  OrderSubscription.new(subscription_id: params[:subscription_id], user_id: current_user.id)
      redirect_to(checkout_subscription_create_path, remote: true)
    else
      redirect_to(new_user_session_path)
    end
  end

  # POST /order_subscriptions or /order_subscriptions.json
  def create
    @order_subscription = OrderSubscription.new(order_subscription_params)

    respond_to do |format|
      if @order_subscription.save
        format.html do
          redirect_to(order_subscription_url(@order_subscription), notice: 'Votre abonnement à bien été validé !')
        end
        format.json { render(:show, status: :created, location: @order_subscription) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @order_subscription.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /order_subscriptions/1 or /order_subscriptions/1.json
  def update
    respond_to do |format|
      if @order_subscription.update(order_subscription_params)
        format.html do
          redirect_to(
            order_subscription_url(@order_subscription),
            notice: 'Order subscription was successfully updated.'
          )
        end
        format.json { render(:show, status: :ok, location: @order_subscription) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @order_subscription.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /order_subscriptions/1 or /order_subscriptions/1.json
  def destroy
    @order_subscription.destroy

    respond_to do |format|
      format.html { redirect_to(order_subscriptions_url, notice: 'Order subscription was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_subscription
    @order_subscription = OrderSubscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_subscription_params
    params.fetch(:order_subscription, {})
  end

  def check_user_auth
    return if user_signed_in?

    store_location_for(:user, subscriptions_path)
    redirect_to(new_user_session_path)
  end
end
