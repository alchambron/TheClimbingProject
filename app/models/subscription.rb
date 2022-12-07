class Subscription < ApplicationRecord
  has_many :order_subscriptions
end
