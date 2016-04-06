# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Nick", last_name: "Cage", username: "cagen", password: "1234")

5.times do |x|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: Faker::Internet.password)
end

10.times do |x|
  Account.create(account_number: "#{Faker::Number.number(10)}", balance: Faker::Number.between(1000, 10000), user_id: Faker::Number.between(1, 10))
end
