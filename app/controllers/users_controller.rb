class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    order_user = OrderSubscription.where(user_id: current_user.id)
  end
end