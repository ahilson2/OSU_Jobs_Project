class Notification < ActiveRecord::Base
  belongs_to :user

  def self.send_jobs
    @jobs = Array.new
    input_feed = Feedjira::Feed.fetch_and_parse('https://www.jobsatosu.com/all_jobs.atom ')
    feed_entries = input_feed.entries
    feed_entries.each do |fe|
      @jobs.push([fe.entry_id,fe.title,fe.author])
    end
    users = User.all
    users.each do |u|
      job_list = Array.new
      id = u.id
      email = u.email
      notifications = Notification.where(user_id: id)
      notifications.each do |n|
        title = n.try(:job_title)
        dept = n.try(:department)
        @jobs.each do |j|
          if j[1] == title || j[2] == dept
            job_list.push(j)
          end
        end
      end
      UserMailer.job_email(email.to_s,job_list).deliver unless job_list.empty?
    end
    
  end

end
