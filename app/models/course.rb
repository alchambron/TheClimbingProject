class Course < ApplicationRecord
  belongs_to :center
  has_many :order_courses

  def get_reserved_slots(date)
    return order_courses.where(date: date).count
  end

  def get_available_slots(date)
    return max_attendees - get_reserved_slots(date)
  end

  def week_day_to_s
    return Date::DAYNAMES[week_day]
  end
end
