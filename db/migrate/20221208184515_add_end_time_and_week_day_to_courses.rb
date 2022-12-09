class AddEndTimeAndWeekDayToCourses < ActiveRecord::Migration[7.0]
  def change
    change_column(:courses, :start_time, :time)
    add_column(:courses, :end_time, :time)
    add_column(:courses, :week_day, :integer)
  end
end
