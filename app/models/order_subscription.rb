class OrderSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  def end_date
    return created_at + subscription.duration.days
  end
end
