require 'faker'

#Create Users
5.times do
  user = User.new(
    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    password: Faker::Lorem::characters(10)
    )
  user.skip_confirmation!
  user.save

users = User.all

  #Creating Tasks
  5.times do
    user.tasks.create(
      description:  Faker::Lorem.sentence)
  end
end

tasks = Task.all

user = User.new(
    name:   "admin",
    email:  "admin@example.com",
    password: "helloworld",
    role: "admin"
    )
  user.skip_confirmation!
  user.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"