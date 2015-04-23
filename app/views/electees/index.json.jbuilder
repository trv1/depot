json.array!(@electees) do |electee|
  json.extract! electee, :id, :user_id
  json.url electee_url(electee, format: :json)
end
