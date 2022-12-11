class Course < ApplicationRecord
  belongs_to :center
  has_many :order_courses

  def week_day_to_s
    return Date::DAYNAMES[(week_day + 1) % 7]
  end

  def price_course
    c = Course.find(course_id)
    return c.price
  end
end
