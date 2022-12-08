class User < ApplicationRecord
  has_many :order_courses
  has_many :courses, through: :order_courses
  has_many :order_subscriptions
  has_many :subscriptions, through: :order_subscriptions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
