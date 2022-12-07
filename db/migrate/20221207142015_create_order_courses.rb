class CreateOrderCourses < ActiveRecord::Migration[7.0]
  def change
    create_table(:order_courses) do |t|
      t.belongs_to(:course, null: false, foreign_key: true)
      t.belongs_to(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
