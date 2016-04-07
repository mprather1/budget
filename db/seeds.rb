User.create(first_name: "Nick", last_name: "Cage", username: "cagen", password: "1234")
User.create(first_name: "Kill", last_name: "Bill", username: "killb", password: "1234")

5.times do |x|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: Faker::Internet.password)
end
