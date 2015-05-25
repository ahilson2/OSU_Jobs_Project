class NotificationsController < ApplicationController
  before_action :set_notification, only: [:destroy]

  def index
    id = get_user
    @notifications = Notification.where(user_id: id) 
  end

  def new
    @notification = Notification.new 
    @jobs = create_job_hash 
    @titles = Array.new
    @depts = Array.new
    @titles.push("")
    @depts.push("")
    @jobs.each_value do |j|
      @titles.push(j[:title])
      @depts.push(j[:department])
    end    
    @depts.uniq!
    @depts.sort!
    @titles.uniq!
    @titles.sort!  
  end


  def create
    @notification = Notification.new(notification_params)
    @notification.user_id = get_user
    respond_to do |format|
      if @notification.save
        format.html { redirect_to notifications_path, notice: 'Email Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { redirect_to bookmarks_path, notice: 'Email Notification was Not created, Please try again.' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @notification.destroy
        format.html { redirect_to notifications_path, notice: 'Email Notification Was Successfully Removed.' }
      else
        format.html {redirect_to notifications_path, notice: 'Email Notification Was NOT Removed, please try again.'}
      end
    end
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:job_title, :department)
    end
end
