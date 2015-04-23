json.array!(@items) do |item|
  json.extract! item, :id, :price, :product_id, :electee_id
  json.url item_url(item, format: :json)
end
