class StoreWorker
  include Sidekiq::Worker

  def perform(id)
    shipment = Shipment.find(id)
    xml = shipment.to_xml(include: :products, root: Shipment)
    save_xml("#{Rails.root}/requests/shipment_#{shipment.id}.xml", xml)
    conn = Net::HTTP.new('200.235.95.196', '3000')
    response  = conn.post("/xml", xml)
    shipment.update_from_xml(response.body)
    save_xml("#{Rails.root}/requests/storage_#{shipment.id}_#{shipment.storage_number}.xml", response.body)
  end

  def save_xml(path, xml)
    File.open(path, 'w') { |file| file.write(xml) }
  end
end
