class User < ApplicationRecord
  has_many :order_courses
  has_many :courses, through: :order_courses
  has_many :order_subscriptions
  has_many :subscriptions, through: :order_subscriptions
  belongs_to :center
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def current_subscription
    order_subscriptions.find { |order| order.end_date > Date.today }
  end

  def has_active_subscription
    !current_subscription.nil?
  end

  def has_course
    order_courses.count < 1
  end

  def future_courses
    order_courses.filter { |order_course| order_course.is_future }
  end
end
