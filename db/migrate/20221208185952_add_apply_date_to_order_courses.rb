class AddApplyDateToOrderCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :order_courses, :date, :date
  end
end
