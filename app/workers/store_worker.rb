class StoreWorker
  include Sidekiq::Worker

  def perform(id)
    shipment = Shipment.find(id)
    conn = Net::HTTP.new('192.168.1.100', '3000')
    response  = conn.post("/xml", shipment.to_xml(include: :products, skip_instruct: true, root: Shipment))
    shipment.update_from_xml(response.body)
  end
end
