class CourseEvent
  attr_accessor :monday_date, :course

  def initialize(course, monday_date)
    @course = course
    @monday_date = monday_date
  end

  def self.from_course(course, date_monday)
    return CourseEvent.new(course, date_monday)
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

  def reservation_success
    return available_slots
  end
end
