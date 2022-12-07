class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table(:subscriptions) do |t|
      t.string(:name)
      t.integer(:price)

      t.timestamps
    end
  end
end
