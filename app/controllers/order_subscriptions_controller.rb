class OrderSubscriptionsController < ApplicationController
  before_action :set_order_subscription, only: %i[ show edit update destroy ]

  # GET /order_subscriptions or /order_subscriptions.json
  def index
    @order_subscriptions = OrderSubscription.all
  end

  # GET /order_subscriptions/1 or /order_subscriptions/1.json
  def show
    @order_subscriptions = OrderSubscription.find(params[:id])
  end

  # GET /order_subscriptions/new
  def new
    @order_subscription = OrderSubscription.new
  end

  # GET /order_subscriptions/1/edit
  def edit
  end

  # POST /order_subscriptions or /order_subscriptions.json
  def create
    @order_subscription = OrderSubscription.new(order_subscription_params)

    respond_to do |format|
      if @order_subscription.save
        format.html { redirect_to order_subscription_url(@order_subscription), notice: "Order subscription was successfully created." }
        format.json { render :show, status: :created, location: @order_subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_subscriptions/1 or /order_subscriptions/1.json
  def update
    respond_to do |format|
      if @order_subscription.update(order_subscription_params)
        format.html { redirect_to order_subscription_url(@order_subscription), notice: "Order subscription was successfully updated." }
        format.json { render :show, status: :ok, location: @order_subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_subscriptions/1 or /order_subscriptions/1.json
  def destroy
    @order_subscription.destroy

    respond_to do |format|
      format.html { redirect_to order_subscriptions_url, notice: "Order subscription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_subscription
      @order_subscription = OrderSubscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_subscription_params
      params.require(:order_subscription).permit(:user_id, :subscription_id, :subscription_end_date, :datetime)
    end
end
