class Addcollumnsubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :description, :text
  end
end
