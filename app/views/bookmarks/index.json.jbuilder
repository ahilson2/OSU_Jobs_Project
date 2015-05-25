json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :account_id, :title, :department, :published, :updated, :url, :links, :content
  json.url bookmark_url(bookmark, format: :json)
end
