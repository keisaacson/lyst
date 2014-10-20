json.array!(@lists) do |list|
  json.extract! list, :id, :list_type
  json.url list_url(list, format: :json)
end
