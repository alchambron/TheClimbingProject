class Changecollumnendsubscription < ActiveRecord::Migration[7.0]

  def change
    remove_column :order_subscriptions, :subscription_end_date
    add_column :order_subscriptions, :subscription_end_date, :datetime
  end
end
