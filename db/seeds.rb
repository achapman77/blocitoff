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
end
users = User.all

#Creating Tasks
20.times do
  Task.create(
    description:  Faker::Lorem.sentence)
end

tasks = Task.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"