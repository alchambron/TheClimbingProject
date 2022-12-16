class Course < ApplicationRecord
  belongs_to :center
  has_many :order_courses
  validates :name, presence: true
  validates :price, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_attendees, presence: true
  validates :week_day, presence: true



  def week_day_to_s
    return Date::DAYNAMES[(week_day + 1) % 7]
  end

end
