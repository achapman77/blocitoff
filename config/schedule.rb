job_type :rake, "cd :path && :environment_variable=:environment :bundle_command rake :task"

set :environment, "development"

every 2.minutes do
  rake "delete_items"
end