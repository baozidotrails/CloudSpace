json.array!(@lots) do |lot|
  json.extract! lot, :name, :width, :height, :pos_left, :pos_top, :space_id, :user_id
  json.url lot_url(lot, format: :json)
end
