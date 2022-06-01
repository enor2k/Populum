# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Suggestion.destroy_all
Suggestion.destroy_all

puts "Creating 20 suggestions and users..."

n = 0
20.times do
  n += 1
  User.create(first_name: "FirstName#{n}", last_name: "LastName #{n}", score: rand(10..1000), email: "user#{n}@faker.com", password: "123456")
end

20.times do
  Suggestion.create(title: Faker::Movie.title, user_id: 1, votes: rand(10..100))
end

puts "Done!"
