# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.delete_all
Center.delete_all
Course.delete_all
Subscription.delete_all
OrderCourse.delete_all
OrderSubscription.delete_all

# 3.times do
#     center = Center.create!(
#         name: Faker::WorldCup.city,
#         description: Faker::Lorem.sentence(word_count: 40)
#     )
# end

centers_json = File.read('db/seeds/centers.json')
centers = JSON.parse(centers_json)
centers.each do |center|
  Center.create!(
    name: center['name'],
    description: center['description'],
    latitude: center['latitude'],
    longitude: center['longitude']
  )
end

# Adding Admin
user = User.create!(
  first_name: 'admin',
  last_name: 'admin',
  birth_date: Faker::Date.between(from: '1960-09-23', to: '2004-09-25'),
  email: 'admin@admin.fr',
  password: 'admins',
  is_admin: true,
  center_id: 1
)

20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.between(from: '1960-09-23', to: '2004-09-25'),
    email: Faker::Internet.free_email,
    password: Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1),
    center_id: rand(1..3)
  )
end

starting_time = Faker::Date.between(from: '2022-12-20', to: '2023-09-25')
ending_time = starting_time + (2 * 60 * 60)

6.times do
  course = Course.create!(
    name: Faker::Lorem.characters(number: 10),
    price: Faker::Commerce.price,
    start_time: starting_time,
    center_id: rand(1..3),
    max_attendees: rand(4..16),
    end_time: ending_time,
    week_day: rand(0..6)
  )
end

3.times do
  susbscription = Subscription.create!(
    name: Faker::Games::SuperMario.character,
    price: Faker::Commerce.price,
    description: Faker::Lorem.sentence(word_count: 20),
    duration: rand(30..180)
  )
end

10.times do
  order_courses = OrderCourse.create!(course_id: rand(1..6), user_id: rand(1..20))
end

15.times do
  order_subscriptions = OrderSubscription.create!(user_id: rand(1..20), subscription_id: rand(1..3))
end

puts 'Seed Successful'
