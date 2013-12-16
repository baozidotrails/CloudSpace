json.array!(@spaces) do |space|
  json.extract! space, :name, :img, :is_rented, :user_id
  json.url space_url(space, format: :json)
end
