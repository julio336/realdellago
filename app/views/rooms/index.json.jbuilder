json.array!(@rooms) do |room|
  json.extract! room, :id, :status, :type, :date_occupied, :price, :adult, :kid, :date_start, :date_end
  json.url room_url(room, format: :json)
end
