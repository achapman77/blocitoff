require 'faker'

#Creating Tasks
20.times do
  Task.create(
    description:  Faker::Lorem.sentence)
end

tasks = Task.all

puts "Seed finished"
puts "#{Task.count} tasks created"