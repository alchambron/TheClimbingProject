class Addcollumnchargeid < ActiveRecord::Migration[7.0]
  def change
    add_column :order_courses, :charge_id, :string
  end
end
