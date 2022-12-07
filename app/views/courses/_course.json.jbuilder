json.extract! course, :id, :name, :price, :start_time, :center_id, :max_attendees, :created_at, :updated_at
json.url course_url(course, format: :json)
