json.extract! order_subscription, :id, :user_id, :subscription_id, :subscription_end_date, :datetime, :created_at, :updated_at
json.url order_subscription_url(order_subscription, format: :json)
