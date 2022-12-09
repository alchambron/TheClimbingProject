class Center < ApplicationRecord
  has_many :courses
  has_many :users
end
