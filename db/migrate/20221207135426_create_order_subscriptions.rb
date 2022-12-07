class CreateOrderSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table(:order_subscriptions) do |t|
      t.belongs_to(:user, null: false, foreign_key: true)
      t.belongs_to(:subscription, null: false, foreign_key: true)
      t.string(:subscription_end_date)
      t.string(:datetime)

      t.timestamps
    end
  end
end
