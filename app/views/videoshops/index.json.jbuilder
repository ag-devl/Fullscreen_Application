json.array!(@videoshops) do |videoshop|
  json.extract! videoshop, :id, :name, :videoid, :views, :prerollads
  json.url videoshop_url(videoshop, format: :json)
end
