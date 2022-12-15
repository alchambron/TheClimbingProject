class Subscription < ApplicationRecord
  has_many :order_subscriptions
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :duration, presence: true
end
