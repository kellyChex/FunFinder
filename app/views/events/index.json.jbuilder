json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_date, :end_date, :location, :time, :user_id
  json.url event_url(event, format: :json)
end
