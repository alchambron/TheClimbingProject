class Course < ApplicationRecord
  belongs_to :center
  has_many :order_courses
end
