class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def get_user
    current_user.try(:id)
  end
  
  # This function will return a hash containing all of the jobs from the
  # OSU jobs atom feed.
  def create_job_hash
    input_feed = Feedjira::Feed.fetch_and_parse('https://www.jobsatosu.com/all_jobs.atom ')
    feed_entries = input_feed.entries
    @jobs = Hash.new
    feed_entries.each do |fe|
      discription = ActionView::Base.full_sanitizer.sanitize(fe.content)
      if discription.length > 500
        short_discription = discription[0..500]+"..."
      else
        short_discription = discription
      end
      link = fe.links[0]
      @jobs[fe.entry_id] =  
        {published: fe.published,
         updated: fe.updated,
         url: fe.url,
         links: link,
         title: fe.title,
         content: short_discription,
         full_content: discription,
         department: fe.author} 
    end
    @jobs
  end  

end
