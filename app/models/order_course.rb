class OrderCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user

  def futures_courses
    
  end
  
end
