class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  require 'will_paginate/array'

  def index
    id = get_user
    @bookmarks = Bookmark.where(user_id: id)
    Bookmark.sort(@bookmarks)
    @bookmark_count = @bookmarks.length
    @bookmarks = @bookmarks.paginate(:page => params[:page], :per_page => 10)   
  end

  def create
    @book = Bookmark.new
    @jobs = create_job_hash
    job_entry_id = params[:the_job]
    @jobs.each {|key,value| @job = value if key == job_entry_id }
    unless @job.nil?
      @book.published = @job[:published]
      @book.updated = @job[:updated]
      @book.url = @job[:url]
      @book.links = @job[:links]
      @book.title = @job[:title]
      @book.content = @job[:full_content]
      @book.department = @job[:department]
      @book.user_id = get_user
    end
    respond_to do |format|
      if @book.save
        format.html { redirect_to bookmarks_path, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to bookmarks_path, notice: 'Bookmark was Not created, Please try again.' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @bookmark.destroy
        format.html { redirect_to bookmarks_path, notice: 'Bookmark Was Successfully Removed.' }
      else
        format.html {redirect_to bookmarks_path, notice: 'Bookmark Was NOT Removed, please try again.'}
      end
    end
    
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:account_id, :title, :department, :published, :updated, :url, :links, :content)
    end
end
