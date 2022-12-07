json.extract! subscription, :id, :name, :price, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
