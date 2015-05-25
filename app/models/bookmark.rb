class Bookmark < ActiveRecord::Base
  belongs_to :user

  def self.sort(bookmarks)
    bookmarks.sort_by(&:created_at)
  end
end
