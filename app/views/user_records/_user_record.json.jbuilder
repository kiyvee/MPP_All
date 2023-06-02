json.extract! user_record, :id, :library_id, :user_id, :created_at, :updated_at
json.url user_record_url(user_record, format: :json)
