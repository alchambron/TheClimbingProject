class Center < ApplicationRecord
  has_many :courses
  has_many :users
  has_many :restaurants
  has_many :coworkings
  has_many :relaxations
  has_many :loisirs
  has_one_attached :thumbnail
end

