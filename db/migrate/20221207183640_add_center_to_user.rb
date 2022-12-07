class AddCenterToUser < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key(:users, :centers, column: :center_id)
  end
end
