class CourseEvent
  attr_accessor :monday_date, :course

  def initialize(course, monday_date)
    @course = course
    @monday_date = monday_date
  end

  def date
    return @monday_date + @course.week_day
  end

  def start_time
    event_date = date.to_datetime
    return event_date.change({ hour: @course.start_time.hour, min: @course.start_time.min })
  end

  def end_time
    event_date = date.to_datetime
    return event_date.change({ hour: @course.end_time.hour, min: @course.end_time.min })
  end

  def reserved_slots
    return course.order_courses.where(date: date).count
  end

  def available_slots
    return course.max_attendees - reserved_slots
  end

  def has_available_slots
    return available_slots > 0
  end

  # Check if user_id has reservation for the course
  def has_slots_reserved(user_id)
    !user_reserved_slot(user_id).nil?
  end

  def user_reserved_slot(user_id)
    @course.order_courses.where(date: date, user_id: user_id)[0]
  end

  def is_past
    start_time < Time.now
  end
end
