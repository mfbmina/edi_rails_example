json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :delivery_date
  json.url shipment_url(shipment, format: :json)
end
