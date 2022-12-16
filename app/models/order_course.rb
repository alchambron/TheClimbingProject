class OrderCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user

  def start_date_time
    new_time = date.to_datetime
    new_time = new_time.change({ hour: course.start_time.hour, min: course.start_time.min })
    return new_time
  end

  def is_future
    return start_date_time > Time.now
  end
end
