json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :job_title, :department
  json.url notification_url(notification, format: :json)
end
