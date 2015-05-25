class JobsController < ApplicationController
  require 'will_paginate/array'

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = create_job_hash
    job_entry_id = params[:the_job]
    @jobs.each {|key,value| @job = value if key == job_entry_id }
    @depts = Array.new
    @titles = Array.new
    @depts.push("")
    @titles.push("")
    @jobs.each_value do |j|
      @depts.push(j[:department])
      @titles.push(j[:title])
    end
    @depts.uniq!
    @depts.sort!
    @titles.uniq!
    @titles.sort!
   
    dept = params[:dept]
    if dept.nil?
      @dept_tag = "Choose a Department"
    else
      @dept_tag = dept.to_s
      @jobs.delete_if {|key,value| value[:department] != dept.to_s}
      data = [@jobs,"department"]
      @jobs = Job.sort(data)
    end
    title = params[:title]
    if title.nil?
      @title_tag = "Choose a Job Title"
    else
      @title_tag = title.to_s
      @jobs.delete_if {|key,value| value[:title] != title.to_s}
      data = [@jobs,"title"]
      @jobs = Job.sort(data)
    end
    
    sort_by = params[:sort_by]
    @order_tag = "All Jobs"
    unless sort_by.nil?
      if sort_by == "title"
        data = [@jobs,"title"]
        @order_tag = "Job Title"
      elsif sort_by == "dept"
        data = [@jobs,"department"]
        @order_tag = "Posting Department"
      else
        data = [@jobs,"updated"]
      end
      @jobs = Job.sort(data)
    end
    if sort_by.nil? && dept.nil?
      data = [@jobs,"updated"]
      @jobs = Job.sort(data)
    end
    @job_count = @jobs.size
    @jobs = @jobs.paginate(:page => params[:page], :per_page => 10)
    @page_num = params[:page]    
  end

  def home_page
  
  end
 
end
