class StoreWorker
  include Sidekiq::Worker

  def perform(id)
    shipment = Shipment.find(id)
    conn = Net::HTTP.new('localhost', '3000')
    # response  = conn.post("/shipments", shipment.to_xml(include: :products))
    # shipment.update_from_xml(response.body)
  end
end
