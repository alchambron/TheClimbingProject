class CartController < ApplicationController
  def list_courses
    @courses = @cart.courses
  end

  def add_course
    @cart.add_course(params[:id])
    save_to_session
  end

  def delete_course
    @cart.delete_course(params[:id])
    save_to_session
    redirect_back(fallback_location: root_path)
  end

  def list_subscription
    @subscriptions = @cart.subscriptions
  end

  def add_subscription
    @cart.add_subscription(params[:id])
    save_to_session
  end

  def delete_subscription
    @cart.delete_subscription(params[:id])
    save_to_session
    redirect_back(fallback_location: root_path)
  end

  def save_to_session
    session[:cart] = @cart
  end
end
