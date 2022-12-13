class OrderSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  def end_subscription(duration, date)
    result = date + duration.days
  end
end
