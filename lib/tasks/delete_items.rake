task delete_items: :environment do
  puts
  puts "Deleting Old Items **************************"
  puts
  Task.where("created_at <= ?", Time.now - 1.days).destroy_all
end