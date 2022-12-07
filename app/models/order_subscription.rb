class OrderSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
end
