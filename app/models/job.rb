class Job < ActiveRecord::Base

  def self.sort sort_params  
    jobs = sort_params[0]
    param = sort_params[1]
    if param == "title"
      jobs = jobs.sort_by{ |k,v| v[:title]}
    elsif param == "department"
      jobs = jobs.sort_by{ |k,v| v[:department]}
    elsif param == "updated"
      jobs = jobs.sort_by{ |k,v| v[:updated]}
      jobs = jobs.to_a.reverse
    end
    jobs
  end

end
