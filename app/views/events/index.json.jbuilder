json.array!(@events) do |event|
  json.extract! event, :id, :title, :date, :location, :time, :user_id
  json.url event_url(event, format: :json)
end
