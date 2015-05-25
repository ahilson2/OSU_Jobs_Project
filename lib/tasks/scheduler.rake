desc "Heroku scheduler tasks"
task :send_jobs => :environment do
  Notification.send_jobs
end
